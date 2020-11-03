<template>
  <div class="container">
    <div class="row">
      <div class="col">
        <input type="text" v-model="city" @keyup.enter="getWeather"/>
        {{ weather }}
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      api: 'http://api.openweathermap.org/data/2.5/weather?q=',
      city: '',
      key: 'a9a5f497177d55bbc5c65a33f2a12da2',
      weather: '...'
    }
  },
  computed: {
    url() {
      return this.api + this.city + '&appid=' + this.key
    }
  },
  methods: {
    getWeather() {
      axios.get(this.url).then(data => {
        this.weather = JSON.stringify(data)
      })
    }
  }

}
</script>