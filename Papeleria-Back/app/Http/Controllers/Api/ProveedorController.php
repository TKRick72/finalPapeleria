<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Proveedor;
use App\Models\Pedido;
use App\Models\DetallePedido;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;

class ProveedorController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'nombre' => 'string|nullable',
            'ciudad' => 'string|nullable',
        ]);

        $query = Proveedor::query();

        $query->when($request->input('nombre'), fn(Builder $q, $nombre) => $q->where('nombre', 'like', "%{$nombre}%"));
        $query->when($request->input('ciudad'), fn(Builder $q, $ciudad) => $q->where('ciudad', 'like', "%{$ciudad}%"));

        $proveedores = $query->orderBy('nombre')->get();

        // Calculate metrics manually using the correct relationship
        $proveedores->each(function ($proveedor) {
            $productoIds = $proveedor->productos()->pluck('id');
            $pedidoIds = DetallePedido::whereIn('producto_id', $productoIds)->distinct()->pluck('pedido_id');
            $pedidos = Pedido::with('envio')->whereIn('id', $pedidoIds)->get();

            $proveedor->total_ventas = $pedidos->sum('total');

            $pedidosConEnvio = $pedidos->filter(fn($p) => $p->envio && $p->envio->fecha_entrega);
            $totalEntregas = $pedidosConEnvio->count();

            if ($totalEntregas > 0) {
                $totalDias = $pedidosConEnvio->sum(fn($p) => $p->created_at->diffInDays($p->envio->fecha_entrega));
                $proveedor->tiempo_promedio_envio = round($totalDias / $totalEntregas, 2);
                $proveedor->tasa_confiabilidad = round(($pedidosConEnvio->count() / $totalEntregas) * 100, 2);
            } else {
                $proveedor->tiempo_promedio_envio = 0;
                $proveedor->tasa_confiabilidad = 0;
            }
        });

        // Filter by sales after calculation
        $ventas_min = $request->input('ventas_min');
        $ventas_max = $request->input('ventas_max');

        $filteredProveedores = $proveedores->when($ventas_min, fn($collection) => $collection->where('total_ventas', '>=', $ventas_min))
                                         ->when($ventas_max, fn($collection) => $collection->where('total_ventas', '<=', $ventas_max));

        return response()->json($filteredProveedores->values());
    }

    public function show(string $id)
    {
        // Implementation for show can be added here if needed following the same logic
        $proveedor = Proveedor::findOrFail($id);
        return response()->json($proveedor);
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:proveedores',
            'ciudad' => 'nullable|string|max:255',
        ]);
        $proveedor = Proveedor::create($request->all());
        return response()->json($proveedor, 201);
    }

    public function update(Request $request, Proveedor $proveedor)
    {
        $request->validate([
            'nombre' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|string|email|max:255|unique:proveedores,email,' . $proveedor->id,
            'ciudad' => 'nullable|string|max:255',
        ]);
        $proveedor->update($request->all());
        return response()->json($proveedor);
    }

    public function destroy(Proveedor $proveedor)
    {
        $proveedor->delete();
        return response()->json(null, 204);
    }
}
