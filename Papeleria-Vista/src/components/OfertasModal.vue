<template>
  <div v-if="show" class="modal-overlay" @click.self="close">
    <div class="modal-container">
      <button class="close-button" @click="close">&times;</button>
      <div class="modal-header">
        <h2>¡Ofertas especiales para ti!</h2>
        <p>Basado en tus compras más recientes, te podrían interesar estos productos.</p>
      </div>
      <div class="modal-body">
        <div v-if="ofertas.length > 0" class="ofertas-grid">
          <div v-for="oferta in ofertas" :key="oferta.id" class="oferta-card">
            <img :src="getImageUrl(oferta.imagen)" :alt="oferta.nombre" class="oferta-imagen">
            <div class="oferta-info">
              <h4 class="oferta-nombre">{{ oferta.nombre }}</h4>
              <p class="oferta-precio">${{ parseFloat(oferta.precio).toFixed(2) }}</p>
            </div>
          </div>
        </div>
        <div v-else>
          <p>No hay ofertas especiales en este momento, ¡pero explora nuestro catálogo!</p>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-secondary" @click="close">Cerrar</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue';

defineProps({
  show: {
    type: Boolean,
    required: true,
  },
  ofertas: {
    type: Array,
    required: true,
  },
});

const emit = defineEmits(['close']);

const close = () => {
  emit('close');
};

const getImageUrl = (imageName) => {
    if (!imageName) {
        // Imagen por defecto inline para evitar errores de red
        return 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTUwIiBoZWlnaHQ9IjE1MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTUwIiBoZWlnaHQ9IjE1MCIgZmlsbD0iI2NjYyIvPjx0ZXh0IHg9Ijc1IiB5PSI4MCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iIzAwMCI+Tm8gSW1hZ2U8L3RleHQ+PC9zdmc+';
    }
    // Las imágenes ahora están en la carpeta `public/imagenes` del frontend.
    return `/imagenes/${imageName}`;
};

</script>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.6);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-container {
  background: white;
  border-radius: 8px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.3);
  width: 90%;
  max-width: 600px;
  position: relative;
  padding: 20px;
}

.close-button {
  position: absolute;
  top: 10px;
  right: 15px;
  font-size: 2rem;
  font-weight: bold;
  color: #aaa;
  background: none;
  border: none;
  cursor: pointer;
}

.modal-header h2 {
  margin-top: 0;
  color: #333;
}

.ofertas-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: 15px;
  margin-top: 20px;
}

.oferta-card {
  border: 1px solid #eee;
  border-radius: 8px;
  text-align: center;
  overflow: hidden;
}

.oferta-imagen {
  width: 100%;
  height: 100px;
  object-fit: cover;
}

.oferta-info {
    padding: 10px;
}

.oferta-nombre {
  font-size: 0.9rem;
  margin: 5px 0;
}

.oferta-precio {
  font-size: 1rem;
  font-weight: bold;
  color: #007bff;
  margin: 0;
}

.modal-footer {
  text-align: right;
  margin-top: 20px;
}

.btn-secondary {
    padding: 10px 20px;
    border-radius: 5px;
    border: 1px solid #ccc;
    background-color: #f0f0f0;
    cursor: pointer;
}
</style>
