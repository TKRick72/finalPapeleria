<template>
  <footer class="bg-dark text-white mt-5 p-4 text-center">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h5>Sobre Nosotros</h5>
          <p>Tu papelería de confianza.</p>
        </div>
        <div class="col-md-4">
          <h5>Enlaces</h5>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">Inicio</a></li>
            <li><a href="#" class="text-white">Productos</a></li>
            <li><a href="#" class="text-white">Contacto</a></li>
          </ul>
        </div>
        <div class="col-md-4">
          <h5>Quejas y Sugerencias</h5>
          <form @submit.prevent="submitFeedback">
            <div class="mb-2">
              <textarea
                class="form-control"
                rows="3"
                placeholder="Escribe tu queja, sugerencia o felicitación..."
                v-model="feedback"
                required
              ></textarea>
            </div>
            <button type="submit" class="btn btn-primary btn-sm" :disabled="isSubmitting">
              <span v-if="isSubmitting" class="spinner-border spinner-border-sm me-2"></span>
              Enviar
            </button>
          </form>
          <p v-if="message" class="mt-2 text-success small">{{ message }}</p>
        </div>
      </div>
      <div class="mt-3">
        <p>&copy; 2025 Papelería Vista. Todos los derechos reservados.</p>
      </div>
    </div>
  </footer>
</template>

<script setup>
import { ref } from 'vue';

const feedback = ref('');
const isSubmitting = ref(false);
const message = ref('');

const submitFeedback = async () => {
  isSubmitting.value = true;
  message.value = '';

  // Simulación: Mostrar mensaje de éxito
  setTimeout(() => {
    message.value = '¡Gracias por tu feedback! Lo revisaremos pronto.';
    feedback.value = '';
    isSubmitting.value = false;
  }, 1000);
};
</script>

<style scoped>
a {
  text-decoration: none;
}
a:hover {
  text-decoration: underline;
}
</style>
