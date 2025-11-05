<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Support\Facades\DB;

class Proveedor extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'proveedores';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'nombre',
        'email',
        'ciudad',
    ];

    /**
     * Get all of the productos for the Proveedor.
     */
    public function productos()
    {
        return $this->hasMany(Producto::class);
    }

    /**
     * Get all of the pedidos for the Proveedor through productos and detalle_pedido.
     */
    public function pedidos()
    {
        return Pedido::whereHas('detalles.producto', function ($query) {
            $query->where('proveedor_id', $this->id);
        })->with(['detalles.producto', 'envio']);
    }
}
