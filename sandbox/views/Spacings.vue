<template>
  <div class="flex justify-content-space-between align-items-start">
    <template v-for="direction in ['', 't', 'b', 'l', 'r', 'x', 'y']">
      <div>
        <template v-for="lvl in 20">
          <div class="container">
            <div :class="`content m${direction}-${lvl - 1}`">
              <div class="content-body">{{ `m${direction}-${lvl - 1}` }}</div>
            </div>
          </div>
        </template>
      </div>
    </template>
  </div>
</template>
<script>
export default {};
</script>
<style>
.container {
  border: 3px solid cornflowerblue;
}

.content {
  border: 3px solid olivedrab;
}

.content-body {
  border: 3px solid tomato;
}
</style>
