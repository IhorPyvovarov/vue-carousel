<script setup>
  import { ref } from "vue";
  import 'swiper/css';
  const lunchPrice = ref(0)
  const props = defineProps({
    restaurantData: Object
  })

  const getLunchPrice = () => {
    return props.restaurantData.menu.reduce((acc, v) => acc + v.price, 0)
  }

  lunchPrice.value = getLunchPrice().toFixed(2)
</script>

<template>
  <div class="card">
    <div class="card__image-block" :style="{background: `url(/src/assets/img/restaurants/${restaurantData.photo})`, backgroundSize: 'cover'}">
      <div class="card__image-info">
        <h2 class="card__image-info__name">{{ restaurantData.name }}</h2>
        <p>{{ restaurantData.address }}</p>
        <p>{{ restaurantData.workHours }}</p>
      </div>
    </div>
    <div class="card__menu">
      <ul class="list-style-none">
        <li v-for="m in restaurantData.menu" class="card__menu__item">
          <span class="card__menu__name">{{ m.name }}</span>
          <span class="card__menu__price">{{ m.price.toFixed(2) }} р</span>
        </li>
      </ul>
      <div class="card__menu__sum">{{ lunchPrice }} р</div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
  .card {
    border: 1px solid var(--carouse-slide-border-color);
    border-radius: .25rem;
    height: 100%;
    display: flex;
    flex-direction: column;
    flex-shrink: 0;
    overflow: hidden;
    &__image-block {
      min-height: 240px;
      color: var(--white);
      position: relative;
      overflow: hidden;
      &:hover {
        cursor: pointer;
        .card__image-info {
          transform: translateY(60%);
          &__name {
            text-decoration: underline;
          }
        }
      }
    }
    &__image-info {
      text-align: center;
      position: absolute;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: var(--green);
      padding: .5rem;
      z-index: 1;
      transition: transform .3s;
      &::before {
        content: "";
        clip-path: ellipse(70% 40px at bottom center);
        background-color: var(--green);
        position: absolute;
        top: -10px;
        left: 0;
        width: 100%;
        height: 40px;
        z-index: -1;
      }
      &__name {
        margin-bottom: .25rem;
      }
    }
    &__menu {
      display: flex;
      flex-direction: column;
      height: 100%;
      padding: 1rem .5rem .5rem .5rem;
      &__item {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        &:not(:last-child) {
          margin-bottom: .5rem;
        }
        &:last-child {
          margin-bottom: 1rem;
        }
      }
      &__name {
        font-weight: 500;
      }
      &__price {
        font-size: 0.875rem;
        margin-left: .25rem;
        padding: .125rem 0.25rem;
        background-color: var(--green-darker);
        border-radius: .25rem;
        white-space: nowrap;
      }
      &__sum {
        font-size: 1.125rem;
        font-weight: 700;
        text-align: right;
        margin-top: auto;
      }
    }
  }
</style>