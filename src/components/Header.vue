<template>
  <section id="header" class="header">
  <div class="container header-container">
  
    <div class="header-logo">
      <img src="../assets/image/Logo.png" alt="Logo" />
    </div>
    
    <div class="header-nav">
      <a v-for="item in nav" :key="item.title" :href="item.url">
        {{ item.title }}
        <svg width="10" height="15" viewBox="0 0 10 15" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M7.71935 5.92717L2.38179 0.778625L0.391602 2.69863L5.72916 7.84685L0.391602 12.9951L2.38179 14.9147L9.70998 7.84685L7.71935 5.92717Z" fill="black"/>
        </svg>
      </a>
    </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'Header',
  props: {
    logo: {
      type: String,
      default: '../assets/image/Logo.png',
    },
    nav: {
      type: Array,
      default: () => [
        { title: 'Home', url: '#' },
        { title: 'Contact Us', url: '#contact' },
      ],
    },
  },
};
</script>

<style scoped>
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: calc(100vw - 100px)
}

.header-container{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: flex-start;
  min-height: 92px;
  max-height: 92px;
  padding: 0 50px;
  overflow: visible;
}

.header-logo img {
  width: auto;
}

.header-nav {
  display: flex;
  align-self: center;
  gap: 20px;
}

.header-nav a {
  text-decoration: none;
  font-size: 1.3rem;
  font-weight: 500;
  border: 2px solid #000000;
  border-radius: 100px;
  color: #000000;
  min-width: 135px;
  padding: 0 16px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}

.header-nav a:hover {
  color: #000000;
}

.header-nav a svg{
    position: absolute;
    top: 50%;
    right: 8px;
    transform: translate(0, -50%)
}

@media (max-width: 768px) {
  .header-container {
    flex-direction: column;
    gap: 15px;
    padding: 15px 20px;
  }

  .header-nav {
    flex-direction: column;
    align-items: center;
    gap: 10px;
  }
}
</style>