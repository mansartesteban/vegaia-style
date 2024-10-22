<template>
  <div class="main-div">
    <router-view></router-view>
  </div>
</template>

<script setup></script>

<style scoped lang="scss">
.main-div {
  display: grid;
  grid-template-columns: repeat(8, 1fr);
  width: 100%;
}
</style>
