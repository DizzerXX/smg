<template>
    <section class="roadmap">
        <div class="container">
            <div class="roadmap-images">
                <img :src="roadmapImg1" alt="">
                <img :src="roadmapImg2" alt="">
            </div>
            <div class="roadmap-title">
                <h1>{{ title }}</h1>
                <img :src="logo" alt="" class="roadmap-logo">
            </div>
            <div class="roadmap-timeline">
                <img :src="timeline" alt="" data-aos="flip-left" data-aos-delay="500">
            </div>
            <img class="bg-img-1" :src="bg1" alt="" data-aos="fade-left" data-aos-delay="500">
            <img class="bg-img-2" :src="bg2" alt="" data-aos="fade-right" data-aos-delay="500">
        </div>
    </section>
</template>

<script>
export default {
    name: "Roadmap",
    props: {
        title: {
            type: String,
            default: "myStarjob FAIR 2025 Roadmap"
        },
        logo: {
            type: String,
            default: new URL("@/assets/image/logo.png", import.meta.url).href
        },
        timeline: {
            type: String,
            default: new URL("@/assets/image/roadmapDates.png", import.meta.url).href
        },
        roadmapImg1: {
            type: String,
            default: new URL("@/assets/image/findTheRightTalent.png", import.meta.url).href
        },
        roadmapImg2: {
            type: String,
            default: new URL("@/assets/image/earlyBirdPrice.png", import.meta.url).href
        },
        bg1: {
            type: String,
            default: new URL("@/assets/image/roadmapBgLeft-removebg-preview.png", import.meta.url).href
        },
        bg2: {
            type: String,
            default: new URL("@/assets/image/roadmapBgRight-removebg-preview.png", import.meta.url).href
        }
    }
}
</script>

<style scoped>
.roadmap {
    position: relative;
}

.bg-img-1,
.bg-img-2 {
    position: absolute;
    z-index: 1;
    bottom: 0
}

.bg-img-1 {
    bottom: 0;
}

.bg-img-2 {
    right: 0;
}

.roadmap-title {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-around;
}


.roadmap-images {
    display: flex;
    align-items: center;
    justify-content: center;
    max-width: 780px;
    margin: 0 auto;
}

.roadmap-images img {
    width: 100%;
    height: auto;
    display: block;
}

@media screen and (max-width: 768px) {
    .roadmap-logo {
        width: 40vw;
    }

    .roadmap-timeline img {
        width: 80vw
    }

    .bg-img-1,
    .bg-img-2 {
        width: 20vw
    }
}

@media screen and (max-width: 425px) {
    .roadmap-title {
        flex-direction: column;
    }
}
</style>