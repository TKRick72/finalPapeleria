<template>
  <div v-if="isVisible" class="modal-backdrop">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Crear Cuenta</h5>
        <button type="button" class="btn-close" @click="$emit('close')"></button>
      </div>

      <form @submit.prevent="handleRegister">
        <div class="modal-body">
          <p v-if="errorMessage" class="text-danger small">{{ errorMessage }}</p>

          <div class="mb-3">
            <label for="nombre" class="form-label">Nombre:</label>
            <input
              type="text"
              class="form-control"
              id="nombre"
              v-model="credentials.nombre"
              required
            >
          </div>

          <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input
              type="email"
              class="form-control"
              id="email"
              v-model="credentials.email"
              required
            >
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Contraseña:</label>
            <input
              type="password"
              class="form-control"
              id="password"
              v-model="credentials.password"
              required
            >
          </div>

          <div class="mb-3">
            <label for="password_confirmation" class="form-label">Confirmar Contraseña:</label>
            <input
              type="password"
              class="form-control"
              id="password_confirmation"
              v-model="credentials.password_confirmation"
              required
            >
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" @click="$emit('close')">Cancelar</button>
          <button type="submit" class="btn btn-primary" :disabled="isLoading">
            <span v-if="isLoading" class="spinner-border spinner-border-sm me-2"></span>
            Registrarse
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue';
import { register } from '../store.js'; // Importa la función de register del store

const props = defineProps({
  isVisible: {
    type: Boolean,
    default: false
  }
});

const emit = defineEmits(['close']);

const credentials = reactive({
  nombre: '',
  email: '',
  password: '',
  password_confirmation: '',
});

const isLoading = ref(false);
const errorMessage = ref('');

// Lógica para llamar a la API de registro
const handleRegister = async () => {
  isLoading.value = true;
  errorMessage.value = '';

  // Llama a la acción register del store
  const success = await register(credentials.nombre, credentials.email, credentials.password, credentials.password_confirmation);

  isLoading.value = false;

  if (success) {
    // Si es exitoso, cierra el modal. La Navbar se actualiza automáticamente
    emit('close');
    credentials.nombre = '';
    credentials.email = '';
    credentials.password = '';
    credentials.password_confirmation = '';
  } else {
    // Muestra el mensaje de error si el registro falla
    errorMessage.value = 'Error en el registro. Verifica los datos e intenta nuevamente.';
  }
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
