<template>
  <div id="app">
    <h1>
      Server Response: <br /><span v-html="resp" style="color: red"></span>
    </h1>
  </div>
</template>

<script>

import axios from "axios";

export default {
  name: "App",
  data() {
    return {
      resp: "",
    };
  },
  mounted() {
    axios.get("http://localhost:8000/a/api").then((resp) => {
      this.resp = resp.data;
    });
  },
};
</script>
