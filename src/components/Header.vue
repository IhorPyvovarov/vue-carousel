<script setup>
  import CarouselControl from "@/components/CarouselControl.vue";
</script>

<template>
  <header class="header">
    <h1>Бизнес-ланчи в Монино</h1>
    <CarouselControl />
  </header>
</template>

<style scoped>
  .header {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
</style>
