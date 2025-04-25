<template>
  <section class="exhibitors">
    <div class="container">
      <h1>{{ title }}</h1>

      <div class="exhibitor-list">
        <img :src="item.url" :alt="item.logo" class="exhibitor-item" v-for="item in exhibitors" :key="item.logo"
          data-aos="zoom-in" data-aos-delay="500" />
      </div>

      <div class="image-list" v-viewer>
        <div class="image-item" v-for="(item, index) in images" :key="index" data-aos="fade-up" data-aos-delay="500">
          <img :src="item.url" :alt="`Gallery image ${index + 1}`" />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'Exhibitors',
  props: {
    title: {
      type: String,
      default: 'Past Exhibitors',
    },
    exhibitors: {
      type: Array,
      default: () => [
        { logo: 'perkeso', url: new URL('@/assets/logos/perkeso.png', import.meta.url).href },
        { logo: 'myfuturejobs', url: new URL('@/assets/logos/myfuturejobs.png', import.meta.url).href },
        { logo: 'kwsp', url: new URL('@/assets/logos/kwsp.png', import.meta.url).href },
        { logo: 'mihrm', url: new URL('@/assets/logos/mihrm.webp', import.meta.url).href },
        { logo: 'mynext', url: new URL('@/assets/logos/mynext.png', import.meta.url).href },
        { logo: 'aham', url: new URL('@/assets/logos/aham.png', import.meta.url).href },
        { logo: 'qi', url: new URL('@/assets/logos/qi.png', import.meta.url).href },
        { logo: 'abc', url: new URL('@/assets/logos/abc.png', import.meta.url).href },
        { logo: 'hays', url: new URL('@/assets/logos/hays.webp', import.meta.url).href },
        { logo: 'aonic', url: new URL('@/assets/logos/aonic.webp', import.meta.url).href },
        { logo: 'allianz', url: new URL('@/assets/logos/allianz.png', import.meta.url).href },
        { logo: 'aat', url: new URL('@/assets/logos/aat.png', import.meta.url).href },
        { logo: 'babas', url: new URL('@/assets/logos/babas.png', import.meta.url).href },
        { logo: 'klfertility', url: new URL('@/assets/logos/klfertility.png', import.meta.url).href },
        { logo: 'lyc', url: new URL('@/assets/logos/lyc.png', import.meta.url).href },
        { logo: 'publicBank', url: new URL('@/assets/logos/publicBank.png', import.meta.url).href },
        { logo: 'seatrium', url: new URL('@/assets/logos/seatrium.png', import.meta.url).href },
        { logo: 'setel', url: new URL('@/assets/logos/setel.png', import.meta.url).href },
        { logo: 'sha', url: new URL('@/assets/logos/sha.png', import.meta.url).href },
        { logo: 'vista', url: new URL('@/assets/logos/vista.png', import.meta.url).href },
        { logo: 'greatEastern', url: new URL('@/assets/logos/greatEastern.png', import.meta.url).href },
        { logo: 'hongleong', url: new URL('@/assets/logos/hongleong.webp', import.meta.url).href },
        { logo: 'marriott', url: new URL('@/assets/logos/marriott.svg', import.meta.url).href },
        { logo: 'desaru', url: new URL('@/assets/logos/desaru.svg', import.meta.url).href },
        { logo: 'padini', url: new URL('@/assets/logos/padini.png', import.meta.url).href },
        { logo: 'sportsdirect', url: new URL('@/assets/logos/sportsdirect.png', import.meta.url).href },
        { logo: 'apar', url: new URL('@/assets/logos/apar.png', import.meta.url).href },
        { logo: 'cimb', url: new URL('@/assets/logos/cimb.png', import.meta.url).href },
        { logo: 'ctrm', url: new URL('@/assets/logos/ctrm.png', import.meta.url).href },
        { logo: 'guardian', url: new URL('@/assets/logos/guardian.webp', import.meta.url).href },
        { logo: 'habib', url: new URL('@/assets/logos/habib.png', import.meta.url).href },
        { logo: 'intercontinental', url: new URL('@/assets/logos/intercontinental.webp', import.meta.url).href },
        { logo: 'mag', url: new URL('@/assets/logos/mag.webp', import.meta.url).href },
        { logo: 'tanChong', url: new URL('@/assets/logos/tanChong.jpeg', import.meta.url).href },
        { logo: 'boost', url: new URL('@/assets/logos/boost.png', import.meta.url).href },
        { logo: 'weir', url: new URL('@/assets/logos/weir.png', import.meta.url).href },
        { logo: 'top', url: new URL('@/assets/logos/top.png', import.meta.url).href },
        { logo: 'lschem', url: new URL('@/assets/logos/lschem.webp', import.meta.url).href },
        { logo: 'pamir', url: new URL('@/assets/logos/pamir.jpeg', import.meta.url).href },
        { logo: 'sidc', url: new URL('@/assets/logos/sidc.png', import.meta.url).href },
      ],
    },
    images: {
      type: Array,
      required: true,
    },
  },
};
</script>

<style scoped>
.container {
  gap: 32px;
}

.exhibitor-list {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  gap: 1rem 3rem;
}

img.exhibitor-item {
  height: 3rem;
}

.image-list {
  display: flex;
  gap: 20px;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  flex-wrap: wrap;
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
  .container {
    gap: 12px;
  }

  .exhibitor-list {
    gap: 0.8rem;
  }

  img.exhibitor-item {
    height: 1.8rem;
  }

  .image-item {
    width: 25vw;
  }
}

@media screen and (max-width: 425px) {
  .container {
    gap: 12px;
  }

  .exhibitor-list {
    gap: 0.4rem;
  }

  img.exhibitor-item {
    height: 1rem;
  }

  .image-item {
    width: 25vw;
  }
}
</style>
