<template>
  <div v-if="isVisible" class="modal-backdrop">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Recuperar Contraseña</h5>
        <button type="button" class="btn-close" @click="$emit('close')"></button>
      </div>

      <form @submit.prevent="handleForgotPassword">
        <div class="modal-body">
          <p v-if="message" class="text-success small">{{ message }}</p>
          <p v-if="errorMessage" class="text-danger small">{{ errorMessage }}</p>

          <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input
              type="email"
              class="form-control"
              id="email"
              v-model="email"
              required
            >
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" @click="$emit('close')">Cancelar</button>
          <button type="submit" class="btn btn-primary" :disabled="isLoading">
            <span v-if="isLoading" class="spinner-border spinner-border-sm me-2"></span>
            Enviar
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const props = defineProps({
  isVisible: {
    type: Boolean,
    default: false
  }
});

const emit = defineEmits(['close']);

const email = ref('');
const isLoading = ref(false);
const message = ref('');
const errorMessage = ref('');

const handleForgotPassword = async () => {
  isLoading.value = true;
  message.value = '';
  errorMessage.value = '';

  // Simulación: Mostrar mensaje de éxito
  setTimeout(() => {
    message.value = 'El administrador te enviará un correo con tu contraseña.';
    email.value = '';
    isLoading.value = false;
  }, 1000);
};
</script>

<style scoped>
/* Estilos necesarios para el funcionamiento del modal */
.modal-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1050;
}
.modal-content {
    background: white;
    padding: 20px;
    border-radius: 8px;
    width: 90%;
    max-width: 400px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
</style>
