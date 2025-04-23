<template>
    <section class="gallery">
      <div class="container">
        <h1 v-if="title">{{ title }}</h1>
        <div class="image-list">
          <div class="image-item" v-for="(item, index) in images" :key="index">
            <img :src="item.url" :alt="`Gallery image ${index + 1}`" />
          </div>
        </div>

        <div class="buttons">
            <svg width="66" height="68" viewBox="0 0 66 68" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M58.8269 7.79869C54.4233 3.25603 48.5688 0.759033 42.3435 0.759033C36.1141 0.759033 30.2596 3.25603 25.854 7.79869C21.4484 12.3372 19.0227 18.378 19.0227 24.8013C19.0227 30.3845 20.8628 35.6732 24.2348 39.9463L19.734 44.5871L18.7086 43.5298L5.0542 57.605L10.5196 63.2405L24.17 49.1653L23.1486 48.108L27.6495 43.4671C31.7936 46.9483 36.9226 48.8414 42.3374 48.8414C48.5668 48.8414 54.4213 46.3403 58.8269 41.7976C67.9197 32.4239 67.9197 17.1724 58.8269 7.79869ZM56.31 39.1982C52.5772 43.0471 47.6184 45.1638 42.3374 45.1638C37.0604 45.1638 32.1016 43.0451 28.3689 39.1982C24.6401 35.3535 22.5853 30.2404 22.5853 24.7992C22.5853 19.358 24.6401 14.2407 28.3709 10.396C32.0996 6.54706 37.0584 4.43035 42.3394 4.43035C47.6164 4.43035 52.5752 6.54915 56.308 10.396C64.0086 18.3404 64.0086 31.2621 56.31 39.1982Z" fill="black"/>
                <path d="M42.3389 7.16943C37.7712 7.16943 33.4811 9.00614 30.2509 12.3327C29.7646 12.8342 29.7646 13.6512 30.2509 14.1527C30.7373 14.6542 31.5296 14.6542 32.016 14.1527C34.774 11.3088 38.4399 9.74584 42.3389 9.74584C46.2419 9.74584 49.9058 11.3088 52.6658 14.1527C52.907 14.4055 53.2272 14.5288 53.5494 14.5288C53.8655 14.5288 54.1857 14.4055 54.4329 14.1527C54.9193 13.6512 54.9193 12.8342 54.4329 12.3327C51.2007 9.00614 46.9066 7.16943 42.3389 7.16943ZM1.85182 60.9103C0.457598 62.3437 0.457598 64.6736 1.85182 66.1049L2.27535 66.5458C3.66957 67.9792 5.92504 67.9792 7.31724 66.5458L9.19376 64.6109L3.72834 58.9754L1.85182 60.9103Z" fill="black"/>
            </svg>
            <div class="view-button">
                click to view
                <svg width="10" height="15" viewBox="0 0 10 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M7.71935 5.92717L2.38179 0.778625L0.391602 2.69863L5.72916 7.84685L0.391602 12.9951L2.38179 14.9147L9.70998 7.84685L7.71935 5.92717Z" fill="black"/>
                </svg>
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

  h1{
    margin-bottom: 50px;
  }
  
  .image-list {
    display: flex;
    gap: 20px;
    align-items: center;
    justify-content: center;
  }
  
  .image-item {
    overflow: hidden;
  }
  
  .image-item img {
    width: auto;
    height: auto;
    max-height: 185px;
    display: block;
    transition: transform 0.3s ease;
  }
  
  .image-item img:hover {
    transform: scale(1.05); /* Slight zoom effect on hover */
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
    width: max-content;
    padding: 0 24px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    cursor: pointer;
  }
  
  .buttons .view-button:hover {
    color: #000000;
  }
  
  .buttons .view-button svg{
      position: absolute;
      top: 50%;
      right: 8px;
      transform: translate(0, -50%)
  }
  
  </style>