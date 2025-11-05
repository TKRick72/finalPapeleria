import { reactive, computed, watch } from 'vue';
import axios from 'axios';

// ====================================================
// CONFIGURACIÓN INICIAL
// ====================================================

const API_URL = 'http://127.0.0.1:8000/api';

// ----------------------------------------------------
// I. LÓGICA DE AUTENTICACIÓN (AUTH)
// ----------------------------------------------------

const authState = {
    token: localStorage.getItem('auth_token') || null,
    user: null, 
};

const storedUser = localStorage.getItem('auth_user');
if (storedUser && storedUser !== 'undefined') {
    try {
        authState.user = JSON.parse(storedUser);
    } catch (e) {
        console.error("Error al parsear auth_user desde localStorage:", e);
        localStorage.removeItem('auth_user');
    }
}

export const auth = reactive(authState);
export const isLoggedIn = computed(() => auth.token && auth.user); 
auth.isLoggedIn = isLoggedIn;

export async function login(email, password) {
    try {
        const response = await axios.post(`${API_URL}/login`, { email, password });
        const { usuario: user, token } = response.data; 

        auth.token = token;
        auth.user = user;

        localStorage.setItem('auth_token', token);
        localStorage.setItem('auth_user', JSON.stringify(user));

        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;

        // *** NUEVO: Obtener ofertas personalizadas después del login ***
        await fetchOfertas();

        return true; 
    } catch (error) {
        console.error("Error de login:", error.response?.data?.message || error.message);
        return false; 
    }
}

export async function logout() {
    try {
        await axios.post(`${API_URL}/logout`);
    } catch (error) {
        console.warn("Logout falló o token expiró. Limpiando estado local.");
    } finally {
        auth.token = null;
        auth.user = null;
        
        localStorage.removeItem('auth_token');
        localStorage.removeItem('auth_user');
        localStorage.removeItem('cart_items');
        
        delete axios.defaults.headers.common['Authorization'];
    }
}

if (auth.token) {
    axios.defaults.headers.common['Authorization'] = `Bearer ${auth.token}`;
}

// ----------------------------------------------------
// II. LÓGICA DE OFERTAS PERSONALIZADAS (NUEVO)
// ----------------------------------------------------

const ofertasState = {
    items: [],
    showModal: false,
};

export const ofertas = reactive(ofertasState);

/**
 * Obtiene las ofertas desde la API y muestra el modal si hay ofertas.
 */
export async function fetchOfertas() {
    if (!isLoggedIn.value) return; // Salir si no está logueado

    try {
        const response = await axios.get(`${API_URL}/ofertas-personalizadas`);
        if (response.data && response.data.length > 0) {
            ofertas.items = response.data;
            ofertas.showModal = true;
        }
    } catch (error) {
        console.error("Error al obtener ofertas:", error);
        ofertas.items = [];
        ofertas.showModal = false;
    }
}

/**
 * Cierra el modal de ofertas.
 */
export function closeOfertasModal() {
    ofertas.showModal = false;
    ofertas.items = [];
}


// ----------------------------------------------------
// III. LÓGICA DEL CARRITO
// ----------------------------------------------------

const cartState = {
    items: JSON.parse(localStorage.getItem('cart_items')) || [],
};

export const cart = reactive(cartState);

export function addToCart(product, quantity = 1) {
    const existingItem = cart.items.find(item => item.id === product.id);
    if (existingItem) {
        existingItem.quantity += quantity;
    } else {
        cart.items.push({ 
            id: product.id, 
            nombre: product.nombre, 
            precio: product.precio, 
            quantity: quantity 
        });
    }
}

export function removeFromCart(productId) {
    const index = cart.items.findIndex(item => item.id === productId);
    if (index !== -1) {
        cart.items.splice(index, 1);
    }
}

watch(
    () => cart.items,
    (newItems) => {
        localStorage.setItem('cart_items', JSON.stringify(newItems));
    },
    { deep: true } 
);
