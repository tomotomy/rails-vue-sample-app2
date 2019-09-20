<template>
  <dl>
    <dt>ID</dt>
    <dd>{{ employee.id }}</dd>
    <dt>Name</dt>
    <dd>{{ employee.name }}</dd>
    <dt>department</dt>
    <dd>{{ employee.department }}</dd>
    <dt>gender</dt>
    <dd>{{ employee.gender }}</dd>
    <dt>birth</dt>
    <dd>{{ employee.birth }}</dd>
    <dt>joined date</dt>
    <dd>{{ employee.joined_date }}</dd>
    <dt>payment</dt>
    <dd>{{ employee.payment }}</dd>
    <dt>note</dt>
    <dd>{{ employee.note }}</dd>
  </dl>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      employee: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/employees/${this.$route.params.id}.json`)
      .then(response => {this.employee = response.data})
  }
}
</script>

<style scoped>
</style>
