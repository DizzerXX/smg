<template>
    <footer class="footer">
        <div class="container">
            <div class="footer-nav">
                <div class="nav-item" v-for="(item, index) in navs" :key="index">
                    <h5>{{ item.title }}</h5>
                    <a class="nav-child" v-for="(child, childIndex) in item.child" :key="childIndex"
                        :href="child.path">{{ child.label }}</a>
                </div>
            </div>
            <div class="footer-socials">
                <a class="socials-item" v-for="(item, index) in socials" :key="index" :href="item.path">
                    <img :src="item.src" :alt="item.alt" />
                </a>
            </div>
            <form class="footer-newsletter" action="#">
                <label for="newsletter">{{ newsletter }}</label>
                <div class="input-row">
                    <input type="text" name="newsletter" id="newsletter" placeholder="Enter Your Email Address Here">
                    <input type="submit" value="Subscribe">
                </div>
            </form>
            <div class="copyright">
                <p>{{ copyright }}</p>
                <p>{{ disclaimer }}</p>
            </div>
        </div>
    </footer>
</template>

<script>
export default {
    name: 'Footer',
    props: {
        navs: {
            type: Array,
            default: () => [
                {
                    title: 'Subscription',
                    child: [
                        {
                            label: 'The Ster Digital Access',
                            path: '#'
                        },
                        {
                            label: 'Newsstand',
                            path: '#'
                        },
                    ]
                },
                {
                    title: 'Advertising',
                    child: [
                        {
                            label: 'Our Rate Card',
                            path: '#'
                        },
                        {
                            label: 'Classfields',
                            path: '#'
                        }
                    ]
                },
                {
                    title: "Company Info",
                    child: [
                        {
                            label: "About Us",
                            path: "#"
                        },
                        {
                            label: "Job Opportunities",
                            path: "#"
                        },
                        {
                            label: "Investor Relations",
                            path: "#"
                        }
                    ]
                },
                {
                    title: "Help",
                    child: [
                        {
                            label: "Contact Us",
                            path: "#"
                        },
                        {
                            label: "FAQs",
                            path: "#"
                        }
                    ]
                },
                {
                    title: "Policies",
                    child: [
                        {
                            label: "Privacy Statement",
                            path: "#"
                        },
                        {
                            label: "Terms & Conditions",
                            path: "#"
                        }
                    ]
                }
            ]
        },
        socials: {
            type: Array,
            default: () => [
                {
                    src: new URL("@/assets/image/footer/youtube.png", import.meta.url).href,
                    alt: "youtube",
                    path: "#"
                },
                {
                    src: new URL("@/assets/image/footer/instagram.png", import.meta.url).href,
                    alt: "instagram",
                    path: "#"
                },
                {
                    src: new URL("@/assets/image/footer/x.png", import.meta.url).href,
                    alt: "x",
                    path: "#"
                },
                {
                    src: new URL("@/assets/image/footer/facebook.png", import.meta.url).href,
                    alt: "facebook",
                    path: "#"
                },
                {
                    src: new URL("@/assets/image/footer/telegram.png", import.meta.url).href,
                    alt: "telegram",
                    path: "#"
                },
                {
                    src: new URL("@/assets/image/footer/googleplay.png", import.meta.url).href,
                    alt: "googlePlay",
                    path: "#"
                },
                {
                    src: new URL("@/assets/image/footer/appstore.png", import.meta.url).href,
                    alt: "appStore",
                    path: "#"
                },
                {
                    src: new URL("@/assets/image/footer/appgallery.png", import.meta.url).href,
                    alt: "appGallery",
                    path: "#"
                }
            ]
        },
        newsletter: {
            type: String,
            default: "Subscribe to our FREE newsletter"
        },
        copyright: {
            type: String,
            default: "Copyright 1995 - 2025 Star Media Group Berhad[197101000523 (10894-D)]"
        },
        disclaimer: {
            type: String,
            default: "Best viewed on Chrome browsers."
        }
    },
};
</script>

<style scoped>
.footer {
    background: #2d2d2d;
    align-items: center;
    display: flex;
    justify-content: center;
    position: relative;
    padding-bottom: 36px;
    margin-top: 4px;
}

.container {
    padding: 30px;
    gap: 32px;
    max-width: 798px;
}

.footer-nav {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    justify-content: space-between;
    gap: 30px;
    flex-grow: 1;
}

h5 {
    color: #B5C2BE;
    margin-bottom: 12px;
}

.nav-item {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
}

.nav-child {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
    color: #7E847B;
    font-size: 1rem;
    font-weight: lighter;
    text-decoration: none;
}

.nav-child:hover {
    text-decoration: none;
    color: #7E847B;
}

.footer-socials {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    gap: 32px;
}

.footer-newsletter {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}

.socials-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

label {
    color: #7E847B;
    font-weight: bold;
    margin-right: 8px;
}

input[type='text'] {
    height: 40px;
    width: 50%;
    background: #FFFFFF;
    bordeR: none;
    box-shadow: none;
    padding: 0 20px;
}

input[type='submit'] {
    background: #000000;
    border: none;
    height: 40px;
    color: #FFFFFF;
}

.input-row {
    justify-content: center;
}

.copyright {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: #282828;
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100vw;
    height: 36px
}

.copyright p {
    font-size: 0.5rem;
    font-weight: normal;
    color: #FFFFFF;
}

@media screen and (max-width: 768px) {
    h5 {
        margin-bottom: 0;
    }

    .footer-socials {
        flex-wrap: wrap;
        gap: 14px;
    }

    .footer-nav {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        align-items: flex-start;
        justify-content: flex-start;
    }

    .container {
        padding: 18px;
    }

    .footer-nav {
        gap: 10px;
    }

    .nav-item {

        text-align: left;
    }
}


@media screen and (max-width: 425px) {
    .footer-newsletter {
        flex-direction: column;
    }


    .footer-nav {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        align-items: flex-start;
        justify-content: flex-start;
    }
}
</style>