<template>
    <section class="gallery">
      <div class="container">
        <h1 v-if="title">{{ title }}</h1>
        <div class="image-list">
          <div class="image-item" v-for="(item, index) in images" :key="index">
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
    background-color: #ffffff; /* White background for contrast */
  }
  
  .image-list {
    display: flex;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    align-items: center;
    justify-content: center;
    max-width: 780px;
    margin: 0 auto;
  }
  
  .image-item {
    overflow: hidden;
  }
  
  .image-item img {
    width: 100%;
    height: auto;
    display: block;
    transition: transform 0.3s ease;
  }
  
  .image-item img:hover {
    transform: scale(1.05); /* Slight zoom effect on hover */
  }
  
  </style>