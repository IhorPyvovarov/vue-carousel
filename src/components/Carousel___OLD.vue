<script setup>
  import restaurants from "@/assets/data/restaurants.json"
  import Card from "@/components/Card.vue";

  import { ref, onMounted } from "vue";

  const initialSlide = ref(0)
  let carousel

  onMounted(() => {
    carousel = document.querySelector('.carousel__container')
  })

  function slide() {
    const slideElement = document.querySelector('.card')
    const slideElementWidth = slideElement.getBoundingClientRect().width
    carousel.style.transform = `translateX(${-initialSlide.value * slideElementWidth}px)`
  }

  function slideToNext() {
    initialSlide.value += 1
    slide()
  }

  function slideToPrev() {
    initialSlide.value -= 1
    slide()
  }
</script>

<template>
    <button @click="slideToPrev">prev</button>
    <button @click="slideToNext">next</button>
  <div class="carousel">
    <div class="carousel__container">
      <Card v-for="restaurant in restaurants" :key="restaurant.id" :restaurantData="restaurant" />
    </div>
  </div>
</template>

<style lang="scss" scoped>
  .carousel {
    overflow-x: hidden;
    margin-top: 3rem;
    &__container {
      display: flex;
      gap: var(--carousel-slide-gap);
      transition: transform .4s;
    }
  }

  @media (max-width: 556px) {
    .carousel {
      &__container {
        gap: 0;
      }
    }
  }
</style>
