<template>
  <div class="card shadow-sm">
    <div class="card-header bg-light">
      <h5 class="mb-0">Top 5 Productos Más Comprados por Cliente</h5>
    </div>
    <div class="card-body">
      <div v-if="!selectedClient">
        <p class="text-muted">Selecciona un cliente para ver sus productos más comprados.</p>
      </div>
      <div v-else>
        <Bar :data="chartData" :options="chartOptions" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch } from 'vue';
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

const props = defineProps({
  selectedClient: {
    type: Object,
    default: null,
  },
  orders: {
    type: Array,
    required: true,
  },
});

const chartData = ref({
  labels: [],
  datasets: [],
});

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  scales: {
    y: {
      beginAtZero: true,
      ticks: {
        precision: 0,
      },
    },
  },
  plugins: {
    legend: {
      display: true,
    },
    tooltip: {
      callbacks: {
        label: function (context) {
          const label = context.dataset.label || '';
          const value = context.parsed.y;
          if (label === 'Cantidad') {
            return `${label}: ${value} unidades`;
          }
          if (label === 'Monto') {
            return `${label}: $${value.toFixed(2)}`;
          }
          return `${label}: ${value}`;
        },
      },
    },
  },
};

// Lógica para procesar los datos del cliente seleccionado
const processedClientData = computed(() => {
  if (!props.selectedClient || !props.orders.length) {
    return { labels: [], quantities: [], amounts: [] };
  }

  const clientOrders = props.orders.filter(order => order.usuario_id === props.selectedClient.id);
  const productMap = new Map();

  clientOrders.forEach(order => {
    if (order.detalles) {
      order.detalles.forEach(detail => {
        const existingProduct = productMap.get(detail.producto.id);
        if (existingProduct) {
          existingProduct.quantity += detail.cantidad;
          existingProduct.amount += detail.cantidad * detail.precio;
        } else {
          productMap.set(detail.producto.id, {
            name: detail.producto.nombre,
            quantity: detail.cantidad,
            amount: detail.cantidad * detail.precio,
          });
        }
      });
    }
  });

  const sortedProducts = [...productMap.values()].sort((a, b) => b.quantity - a.quantity);
  const top5Products = sortedProducts.slice(0, 5);

  return {
    labels: top5Products.map(p => p.name),
    quantities: top5Products.map(p => p.quantity),
    amounts: top5Products.map(p => p.amount),
  };
});

// Actualizar el gráfico cuando los datos procesados cambien
watch(processedClientData, (newData) => {
  chartData.value = {
    labels: newData.labels,
    datasets: [
      {
        label: 'Cantidad Comprada',
        backgroundColor: '#42A5F5',
        data: newData.quantities,
      },
      {
        label: 'Monto Gastado ($)',
        backgroundColor: '#66BB6A',
        data: newData.amounts,
      },
    ],
  };
}, { immediate: true });
</script>