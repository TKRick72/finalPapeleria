<template>
  <div>
    <Navbar @toggle-cart="toggleCart" @open-login-modal="isModalVisible = true" />
    
    <LoginModal :is-visible="isModalVisible" @close="isModalVisible = false" />
    
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
import Footer from './components/Footer.vue';

// Importaciones para el modal de ofertas (NUEVO)
import OfertasModal from './components/OfertasModal.vue';
import { ofertas, closeOfertasModal } from './store.js';

const isCartVisible = ref(false);
const isModalVisible = ref(false);

function toggleCart() {
  isCartVisible.value = !isCartVisible.value;
}
</script>
