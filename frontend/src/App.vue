<script setup>
import Hero from './components/Hero.vue';
import Header from './components/Header.vue';
import Exhibitors from './components/Exhibitors.vue';
import Gallery from './components/Gallery.vue';
import Layout from './components/Layout.vue';
import Directory from './components/Directory.vue';
import Footer from './components/Footer.vue';
import Finder from './components/Finder.vue';
import Roadmap from './components/Roadmap.vue';
import Chatbot from './components/Chatbot.vue';
import { ref } from 'vue';

import imgKL from '@/assets/image/KL.png';
import imgPP from '@/assets/image/PP.png';
import imgJB from '@/assets/image/JB.png';

import imgGallery1 from '@/assets/image/gallery/Rectangle.png';
import imgGallery2 from '@/assets/image/gallery/Rectangle-1.png';
import imgGallery3 from '@/assets/image/gallery/Rectangle-2.png';

import layout1 from '@/assets/image/layout/Rectangle.png';
import layout2 from '@/assets/image/layout/Rectangle-1.png';
import layout3 from '@/assets/image/layout/Rectangle-2.png';

import directoryImg from '@/assets/image/Directory.png';

const pastExhibit = ref([
  { url: imgKL },
  { url: imgPP },
  { url: imgJB },
]);

const galleryImg = ref([
  { url: imgGallery1 },
  { url: imgGallery2 },
  { url: imgGallery3 },
])

const layoutImg = ref([
  { url: layout1 },
  { url: layout2 },
  { url: layout3 },
])

const directory1 = directoryImg

fetch('http://localhost/smg/backend/api/get_exhibitors.php') // adjust your local API path
  .then((res) => res.json())
  .then((data) => {
  })
  .catch((err) => {
    console.error('Error fetching exhibitors:', err);
  });


const boothTable = [
  { name: 'Top Glove Corporation', location: 'Booth A01 - Hall A' },
  { name: 'Petronas', location: 'Booth A02 - Hall A' },
  { name: 'AirAsia', location: 'Booth B01 - Hall B' },
  { name: 'Shopee Malaysia', location: 'Booth B02 - Hall B' },
  { name: 'Maybank', location: 'Booth C01 - Hall C' },
  { name: 'Intel Malaysia', location: 'Booth C02 - Hall C' },
  { name: 'Sunway Group', location: 'Booth D01 - Hall D' },
  { name: 'Grab Malaysia', location: 'Booth D02 - Hall D' },
  { name: 'TM Berhad', location: 'Booth E01 - Hall E' },
  { name: 'TNG Digital', location: 'Booth E02 - Hall E' },
  { name: 'CelcomDigi', location: 'Booth F01 - Hall F' },
  { name: 'Maxis', location: 'Booth F02 - Hall F' },
  { name: 'Top Glove Corporation', location: 'Booth A01 - Hall A' },
  { name: 'Petronas', location: 'Booth A02 - Hall A' },
  { name: 'AirAsia', location: 'Booth B01 - Hall B' },
  { name: 'Shopee Malaysia', location: 'Booth B02 - Hall B' },
  { name: 'Maybank', location: 'Booth C01 - Hall C' },
  { name: 'Intel Malaysia', location: 'Booth C02 - Hall C' },
  { name: 'Sunway Group', location: 'Booth D01 - Hall D' },
  { name: 'Grab Malaysia', location: 'Booth D02 - Hall D' },
  { name: 'TM Berhad', location: 'Booth E01 - Hall E' },
  { name: 'TNG Digital', location: 'Booth E02 - Hall E' },
  { name: 'CelcomDigi', location: 'Booth F01 - Hall F' },
  { name: 'Maxis', location: 'Booth F02 - Hall F' }
]

</script>


<template>
    <Header/>
    <Hero
      title="myStarjob fair 2025"
      subtitle="As one of Malaysia's largest recruitment event providers, myStarjob Fair has served over 26,000 companies and 120,000 visitors. By exhibiting at our fair you will stand a chance to meet a diverse range of candidates and enhance your corporate branding. Since The Star Newspaper also organises this event, it gives extra mileage in terms of publicity and status as one of the top hiring companies in Malaysia,"
      cta-text="Explore Now"
    />
    <Exhibitors :images="galleryImg"/>
    <Gallery :title="'Upcoming Fair'" :images="pastExhibit"/>
    <Layout :title="'Exhibition Hall Layout'" :images="layoutImg"/>
    <Directory :title="'Floor Plan Directory'" :image="directory1" />
    <Finder/>
    <Roadmap/>
    <Chatbot/>
    <Footer/>
</template>

<style scoped>
</style>
