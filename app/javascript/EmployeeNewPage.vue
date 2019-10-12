<template>
  <form @submit.prevent="createEmployee">
    <div v-if="errors.lenght != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div class="">
      <label for="">Name</label>
      <input v-model="employee.name" type="text">
    </div>
    <div class="">
      <label for="">department</label>
      <input v-model="employee.department" type="text" name="" value="">
    </div>
    <div class="">
      <label for="">Gender</label>
      <select v-model="employee.gender" class="" name="">
        <option value="">other</option>
        <option value="">male</option>
        <option value="">female</option>
      </select>
    </div>
    <div class="">
      <label for="">birth</label>
      <input v-model="employee.birth" type="date" name="" value="">
    </div>
    <div class="">
      <label for="">Joined Date</label>
      <input v-model="employee.joined_date" type="date" name="" value="">
    </div>
    <div class="">
      <label for="">payment</label>
      <input v-model="employee.payment" type="number" min="0">
    </div>
    <div class="">
      <label for="">Note</label>
      <input v-model="employee.note" type="text" name="" value="">
    </div>
    <button type="submit" name="button">Commit</button>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      employee: {
        name: '',
        department: '',
        gender: '',
        birth: '',
        joined_date: '',
        payment: '',
        note: '',
      },
      errors: ''
    }
  },
  methods: {
    createEmployee: function() {
      axios
        .post('/api/v1/employee', this.employee)
        .then(response => {
          let e = response.data;
          this.$router.push({ name: 'EmployeeDetailPage', params: { id: e.id }})
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>
