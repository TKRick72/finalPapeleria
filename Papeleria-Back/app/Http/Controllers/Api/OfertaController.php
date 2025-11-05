<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Producto;

class OfertaController extends Controller
{
    /**
     * Obtiene ofertas personalizadas para el usuario autenticado.
     */
    public function obtenerOfertas()
    {
        $user = Auth::user();

        // Si es admin, no se muestran ofertas
        if ($user->es_admin) {
            return response()->json([]);
        }

        // 1. Encontrar el último pedido del usuario
        $ultimoPedido = $user->pedidos()->latest()->first();

        if (!$ultimoPedido) {
            // Caso: Usuario sin historial de compras. Mostrar ofertas genéricas (ej. los más nuevos)
            $ofertas = Producto::latest()->take(4)->get();
            return response()->json($ofertas);
        }

        // 2. Obtener el primer producto de ese último pedido para usar su categoría
        $primerDetalle = $ultimoPedido->detalles()->first();
        if (!$primerDetalle) {
            $ofertas = Producto::latest()->take(4)->get();
            return response()->json($ofertas);
        }

        $productoBase = $primerDetalle->producto;
        $categoriaId = $productoBase->categoria_id;

        // 3. Buscar otros productos en la misma categoría, excluyendo el ya comprado
        $ofertas = Producto::where('categoria_id', $categoriaId)
            ->where('id', '!=', $productoBase->id)
            ->inRandomOrder()
            ->take(4)
            ->get();

        // Si no hay suficientes ofertas en la categoría, no devolver nada o rellenar con genéricas
        if ($ofertas->isEmpty()) {
            return response()->json([]); // O devolver genéricas como antes
        }

        return response()->json($ofertas);
    }
}