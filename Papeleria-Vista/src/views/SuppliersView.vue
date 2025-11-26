<template>
  <div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="mb-0">Gestión y Análisis de Proveedores (SCM)</h2>
      <button class="btn btn-secondary" @click="refreshAllData">
        <i class="bi bi-arrow-clockwise"></i> Actualizar Todo
      </button>
    </div>

    <!-- Pestañas de Navegación -->
    <ul class="nav nav-tabs mb-4" id="suppliersTabs" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="gestion-tab" data-bs-toggle="tab" data-bs-target="#gestion" type="button" role="tab">Gestión de Proveedores</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="analisis-tab" data-bs-toggle="tab" data-bs-target="#analisis" type="button" role="tab">Análisis de Desempeño</button>
      </li>
    </ul>

    <!-- Contenido de las Pestañas -->
    <div class="tab-content" id="suppliersTabsContent">
      <!-- Pestaña 1: Gestión (CRUD) -->
      <div class="tab-pane fade show active" id="gestion" role="tabpanel">
        <div class="card shadow-sm">
          <div class="card-header bg-light d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Lista de Proveedores</h5>
            <button class="btn btn-primary" @click="openAddModal"> 
              <i class="bi bi-plus-circle"></i> Agregar Proveedor
            </button>
          </div>
          <div class="card-body">
            <div v-if="gestionLoading" class="text-center py-3">
              <div class="spinner-border text-primary" role="status"></div>
            </div>
            <div v-else class="table-responsive">
              <table class="table table-hover">
                <thead class="table-light">
                  <tr>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Ciudad</th>
                    <th>Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="supplier in allSuppliers" :key="supplier.id">
                    <td>{{ supplier.nombre }}</td>
                    <td>{{ supplier.email }}</td>
                    <td>{{ supplier.ciudad || 'N/A' }}</td>
                    <td>
                      <button class="btn btn-outline-primary btn-sm me-2" @click="openEditModal(supplier)">
                        <i class="bi bi-pencil"></i> Editar
                      </button>
                      <button class="btn btn-outline-danger btn-sm" @click="deleteSupplier(supplier.id)">
                        <i class="bi bi-trash"></i> Eliminar
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <!-- Pestaña 2: Análisis de Desempeño -->
      <div class="tab-pane fade" id="analisis" role="tabpanel">
        <div class="card shadow-sm mb-4">
          <div class="card-header bg-light">
            <h5 class="mb-0">Filtros de Desempeño</h5>
          </div>
          <div class="card-body">
            <div class="row g-3 align-items-center">
              <div class="col-md-4">
                <label for="filterName" class="form-label">Nombre</label>
                <input type="text" id="filterName" class="form-control" v-model.lazy="analisisFilters.nombre" placeholder="Ej: Proveedor ABC">
              </div>
              <div class="col-md-3">
                <label for="filterCity" class="form-label">Ciudad</label>
                <input type="text" id="filterCity" class="form-control" v-model.lazy="analisisFilters.ciudad" placeholder="Ej: Ciudad de México">
              </div>
              <div class="col-md-5">
                <label class="form-label">Rango de Ventas</label>
                <div class="input-group">
                  <input type="number" class="form-control" v-model.number.lazy="analisisFilters.ventas_min" placeholder="Mínimo">
                  <input type="number" class="form-control" v-model.number.lazy="analisisFilters.ventas_max" placeholder="Máximo">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="card shadow-sm">
          <div class="card-body">
            <div v-if="analisisLoading" class="text-center py-5">
              <div class="spinner-border text-primary" role="status"></div>
            </div>
            <div v-else-if="analisisError" class="alert alert-danger">{{ analisisError }}</div>
            <div v-else class="table-responsive">
              <table class="table table-hover align-middle">
                <thead class="table-light">
                  <tr>
                    <th>Nombre</th>
                    <th class="text-end">Ventas Totales</th>
                    <th class="text-center">Tpo. Envío Prom. (días)</th>
                    <th class="text-center">Tasa Confiabilidad</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="supplier in filteredSuppliers" :key="supplier.id">
                    <td>{{ supplier.nombre }}</td>
                    <td class="text-end">${{ Number(supplier.total_ventas).toFixed(2) }}</td>
                    <td class="text-center">{{ supplier.tiempo_promedio_envio }}</td>
                    <td class="text-center">
                      <span :class="getReliabilityClass(supplier.tasa_confiabilidad)">{{ supplier.tasa_confiabilidad }}%</span>
                    </td>
                  </tr>
                </tbody>
              </table>
              <p v-if="filteredSuppliers.length === 0" class="text-center text-muted mt-3">No hay resultados.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal para Agregar/Editar Proveedor -->
    <div class="modal fade" id="supplierModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ isEditMode ? 'Editar' : 'Agregar' }} Proveedor</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <form @submit.prevent="handleFormSubmit">
              <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" v-model="currentSupplier.nombre" required>
              </div>
              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" v-model="currentSupplier.email" required>
              </div>
              <div class="mb-3">
                <label for="ciudad" class="form-label">Ciudad</label>
                <input type="text" class="form-control" id="ciudad" v-model="currentSupplier.ciudad">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary">{{ isEditMode ? 'Actualizar' : 'Guardar' }}</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref, reactive, onMounted, watch } from 'vue';
import axios from 'axios';
import { Modal } from 'bootstrap';

// --- Estado General ---
const API_URL = 'https://backend-production-9035.up.railway.app/api';
let supplierModal = null;

// --- Pestaña 1: Gestión ---
const allSuppliers = ref([]);
const gestionLoading = ref(true);
const isEditMode = ref(false);
const currentSupplier = reactive({ id: null, nombre: '', email: '', ciudad: '' });

const fetchAllSuppliers = async () => {
  gestionLoading.value = true;
  try {
    const response = await axios.get(`${API_URL}/proveedores`);
    allSuppliers.value = response.data;
  } catch (err) { alert('Error al cargar proveedores.'); } 
  finally { gestionLoading.value = false; }
};

const openAddModal = () => {
  isEditMode.value = false;
  Object.assign(currentSupplier, { id: null, nombre: '', email: '', ciudad: '' });
  supplierModal.show();
};

const openEditModal = (supplier) => {
  isEditMode.value = true;
  Object.assign(currentSupplier, supplier);
  supplierModal.show();
};

const handleFormSubmit = async () => {
  const payload = { ...currentSupplier };
  try {
    if (isEditMode.value) {
      await axios.put(`${API_URL}/proveedores/${payload.id}`, payload);
    } else {
      await axios.post(`${API_URL}/proveedores`, payload);
    }
    supplierModal.hide();
    await fetchAllSuppliers(); // Recargar lista de gestión
  } catch (err) {
    const message = err.response?.data?.message || 'Ocurrió un error.';
    alert(`Error: ${message}`);
  }
};

const deleteSupplier = async (id) => {
  if (confirm('¿Estás seguro de eliminar este proveedor?')) {
    try {
      await axios.delete(`${API_URL}/proveedores/${id}`);
      await fetchAllSuppliers();
    } catch (err) { alert('Error al eliminar.'); }
  }
};

// --- Pestaña 2: Análisis ---
const filteredSuppliers = ref([]);
const analisisLoading = ref(true);
const analisisError = ref(null);
const analisisFilters = reactive({ nombre: '', ciudad: '', ventas_min: null, ventas_max: null });

const fetchFilteredSuppliers = async () => {
  analisisLoading.value = true;
  analisisError.value = null;
  const params = Object.fromEntries(Object.entries(analisisFilters).filter(([, v]) => v !== null && v !== ''));
  try {
    const response = await axios.get(`${API_URL}/proveedores`, { params });
    filteredSuppliers.value = response.data;
  } catch (err) {
    analisisError.value = 'Error al cargar datos de análisis.';
  } finally { analisisLoading.value = false; }
};

const getReliabilityClass = (rate) => {
  if (rate >= 95) return 'badge bg-success';
  if (rate >= 80) return 'badge bg-warning text-dark';
  return 'badge bg-danger';
};

watch(analisisFilters, fetchFilteredSuppliers, { deep: true });

const refreshAllData = () => {
  fetchAllSuppliers();
  fetchFilteredSuppliers();
};

// --- Ciclo de Vida ---
onMounted(() => {
  supplierModal = new Modal(document.getElementById('supplierModal'));
  refreshAllData(); // Call the new refresh function on mount
});

</script>

<style scoped>
.container { max-width: 1200px; }
.form-label { font-weight: 500; }
.badge { font-size: 0.9em; }
</style>
