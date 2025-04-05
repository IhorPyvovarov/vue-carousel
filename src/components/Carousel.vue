<script setup>
  import restaurants from "@/assets/data/restaurants.json"
  import Card from "@/components/Card.vue";

  import 'swiper/css';
  import 'swiper/css/navigation';

  import { Swiper, SwiperSlide } from 'swiper/vue';
  import { Navigation } from 'swiper/modules';

  import {ref} from "vue";
  const modules = ref([Navigation])
</script>

<template>
  <div class="carousel">
    <swiper class="carousel__container"
      :slides-per-view="1"
      :space-between="8"
      :navigation="{
        prevEl: '.carousel-control__btn--prev',
        nextEl: '.carousel-control__btn--next',
        disabledClass: 'carousel-control__btn--disabled'
      }"
      :modules="modules"
      :breakpoints="{
        556: {
          slidesPerView: 2
        },
        768: {
          slidesPerView: 3
        },
        992: {
          slidesPerView: 4
        }
      }"
    >
      <swiper-slide v-for="restaurant in restaurants" :key="restaurant.id" >
        <Card :restaurantData="restaurant" />
      </swiper-slide>
    </swiper>
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
</style>

<style lang="scss">
  .carousel {
    &__container {
      .swiper-wrapper {
        height: auto;
      }
    }
  }
</style>