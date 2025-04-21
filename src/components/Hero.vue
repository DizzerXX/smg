<template>
  <section class="hero">
    <div class="hero-content container">
      <div class="hero-images">
      <div class="hero-image-container">
        <img src="../assets/image/Rectangle.png" />
      </div>
      <div class="hero-image-container">
        <img src="../assets/image/Rectangle-1.png" />
      </div>
      </div>
      <div class="hero-texts">
        <h1>{{ title }}</h1>
        <p>{{ subtitle }}</p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "Hero",
  props: {
    title: {
      type: String,
      default: "Welcome to My Vue App",
    },
    subtitle: {
      type: String,
      default: "Build amazing things with Vue.js",
    },
    ctaText: {
      type: String,
      default: "Get Started",
    },
  },
  methods: {
    handleCtaClick() {
      // Add your CTA logic here (e.g., navigate, trigger event)
      alert("CTA button clicked!");
    },
  },
};
</script>

<style scoped>
.hero {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 478px;

  color: white;
  text-align: center;
}

.hero-content {
  max-width: 1440px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
}

.hero-images {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
}

.hero-image-container{
    display: flex;
    align-items: center;
    justify-content: center;
    flex-grow: 1;
}

.hero-images img {
    max-width: 100%;
}

.hero-texts{
padding: 0 76px;
}
</style>
