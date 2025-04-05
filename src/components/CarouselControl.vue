<script setup>
  import IconArrowLeft from './icons/IconArrowLeft.vue'
  import IconArrowRight from './icons/IconArrowRight.vue'
</script>

<template>
  <div class="carousel-control">
    <IconArrowLeft class="carousel-control__btn carousel-control__btn--prev" />
    <IconArrowRight class="carousel-control__btn carousel-control__btn--next" />
  </div>
</template>

<style lang="scss" scoped>
  .carousel-control {
    display: flex;
    align-items: center;
    gap: 2rem;
    &__btn {
      color: var(--black);
      cursor: pointer;
      &--disabled {
        color: var(--carousel-control-disabled);
        cursor: default;
      }
    }
  }
</style>
