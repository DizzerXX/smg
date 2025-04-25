<template>
  <section class="gallery">
    <div class="container">
      <h1 v-if="title">{{ title }}</h1>
      <div class="image-list" v-viewer>
        <div class="image-item" v-for="(item, index) in images" :key="index" data-aos="fade-up" data-aos-delay="500">
          <img :src="item.url" :alt="`Gallery image ${index + 1}`" />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
defineProps({
  title: {
    type: String,
    required: false,
  },
  images: {
    type: Array,
    required: true,
  },
});
</script>

<style scoped>
.gallery {
  padding: 40px 0;
  background-color: #ffffff;
}

.image-list {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
}

.image-item {
  overflow: hidden;
  width: 300px;
}

.image-item img {
  width: 100%;
  height: auto;
  display: block;
  transition: transform 0.3s ease;
  cursor: pointer;
}

.image-item img:hover {
  transform: scale(1.05);
}

@media screen and (max-width: 768px) {
  .image-item {
    width: 25vw;
  }
}

@media screen and (max-width: 425px) {
  .image-item {
    width: 25vw;
  }
}
</style>
