<template>
  <div>
    <Navbar @toggle-cart="toggleCart" @open-login-modal="isModalVisible = true" @open-register-modal="isRegisterModalVisible = true" />

    <LoginModal :is-visible="isModalVisible" @close="isModalVisible = false" @open-forgot-password="openForgotPassword" />

    <RegisterModal :is-visible="isRegisterModalVisible" @close="isRegisterModalVisible = false" />

    <ForgotPasswordModal :is-visible="isForgotPasswordModalVisible" @close="isForgotPasswordModalVisible = false" />

    <ShoppingCart :is-visible="isCartVisible" @toggle-cart="toggleCart" />

    <!-- Modal de Ofertas Personalizadas (NUEVO) -->
    <OfertasModal
      :show="ofertas.showModal"
      :ofertas="ofertas.items"
      @close="closeOfertasModal"
    />

    <main class="container mt-4">
      <router-view />
    </main>
    <Footer />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import Navbar from './components/Navbar.vue';
import ShoppingCart from './components/ShoppingCart.vue';
import LoginModal from './components/LoginModal.vue';
import RegisterModal from './components/RegisterModal.vue';
import ForgotPasswordModal from './components/ForgotPasswordModal.vue';
import Footer from './components/Footer.vue';

// Importaciones para el modal de ofertas (NUEVO)
import OfertasModal from './components/OfertasModal.vue';
import { ofertas, closeOfertasModal } from './store.js';

const isCartVisible = ref(false);
const isModalVisible = ref(false);
const isRegisterModalVisible = ref(false);
const isForgotPasswordModalVisible = ref(false);

function toggleCart() {
  isCartVisible.value = !isCartVisible.value;
}

function openForgotPassword() {
  isModalVisible.value = false; // Cerrar login modal
  isForgotPasswordModalVisible.value = true;
}
</script>
