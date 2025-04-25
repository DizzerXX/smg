<template>
  <section class="gallery">
    <div class="container">
      <h1 v-if="title">{{ title }}</h1>

      <div class="image-list" ref="viewerRef" v-viewer>
        <div class="image-item" v-for="(item, index) in images" :key="index" data-aos="fade-up" data-aos-delay="500">
          <img :src="item.url" :alt="`Gallery image ${index + 1}`" />
        </div>
      </div>

      <div class="buttons">
        <img :src="magnifyingGlass" alt="">
        <div class="view-button" @click="showViewer">
          click to view
          <svg width="10" height="15" viewBox="0 0 10 15" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M7.71935 5.92717L2.38179 0.778625L0.391602 2.69863L5.72916 7.84685L0.391602 12.9951L2.38179 14.9147L9.70998 7.84685L7.71935 5.92717Z"
              fill="black" />
          </svg>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
const magnifyingGlass = new URL('@/assets/image/magnifyingGlass.png', import.meta.url).href;

defineProps({
  title: {
    type: String,
    required: false,
  },
  images: {
    type: Array,
    required: true,
  },
})

const viewerRef = ref(null)

function showViewer() {
  if (viewerRef.value) {
    viewerRef.value.$viewer.show()
  }
}
</script>

<style scoped>
.gallery {
  padding: 40px 0;
  background-color: #ffffff;
}

h1 {
  margin-bottom: 50px;
}

.image-list {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  align-items: center;
  justify-content: center;
}

.image-item {
  overflow: hidden;
}

.image-item img {
  max-height: 185px;
  display: block;
  transition: transform 0.3s ease;
  cursor: pointer;
  border-radius: 8px;
}

.image-item img:hover {
  transform: scale(1.05);
}

.buttons {
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  justify-content: center;
  margin-top: 1rem;
}

.buttons .view-button {
  text-decoration: none;
  font-size: 1.3rem;
  font-weight: 500;
  border: 2px solid #000000;
  border-radius: 100px;
  color: #000000;
  padding: 0 24px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  cursor: pointer;
}

.buttons .view-button:hover {
  background-color: #000000;
  color: #ffffff;
  transition: 0.3s;
}

.buttons .view-button svg {
  position: absolute;
  top: 50%;
  right: 8px;
  transform: translate(0, -50%);
}

@media screen and (max-width: 768px) {
  .image-item img {
    width: 25vw;
  }

  h1 {
    margin-bottom: 20px;
  }

  .buttons .view-button {
    height: 20px;
    font-size: 1rem;
    padding: 0 20px
  }

  .buttons img {
    height: 40px;
  }
}

@media screen and (max-width: 425px) {
  .image-item img {
    width: 25vw;
  }

  h1 {
    margin-bottom: 20px;
  }

  .buttons .view-button {
    height: 20px;
    font-size: 0.8rem;
    padding: 0 20px
  }

  .buttons img {
    height: 30px;
  }
}
</style>