<template>
  <header id="header" class="header">
    <div class="container header-container">

      <div class="header-logo">
        <img src="../assets/image/Logo.png" alt="Logo" />
      </div>

      <div class="header-hamburger" @click="toggleMenu">
        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M0 7H30M0 15H30M0 23H30" stroke="black" stroke-width="2" />
        </svg>
      </div>

      <div class="header-nav" :class="{ 'active': isMenuOpen }">
        <a v-for="item in nav" :key="item.title" :href="item.url">
          {{ item.title }}
          <svg width="10" height="15" viewBox="0 0 10 15" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M7.71935 5.92717L2.38179 0.778625L0.391602 2.69863L5.72916 7.84685L0.391602 12.9951L2.38179 14.9147L9.70998 7.84685L7.71935 5.92717Z"
              fill="black" />
          </svg>
        </a>

        <a class="be-exhibitor" :href="exhibitor.path" @click="showForm = true">{{ exhibitor.label }}</a>
      </div>
    </div>

    <div v-if="showForm" class="form-modal">
      <div class="form-content">
        <h3>Become an Exhibitor</h3>
        <form @submit.prevent="submitForm">
          <input type="text" v-model="form.name" placeholder="Name" required />
          <input type="email" v-model="form.email" placeholder="Email" required />
          <textarea v-model="form.message" placeholder="Tell us about your company" required></textarea>
          <div class="form-buttons">
            <button type="submit">Submit</button>
            <button type="button" @click="showForm = false">Cancel</button>
          </div>
        </form>
        <p v-if="formStatus" class="status">{{ formStatus }}</p>
      </div>
    </div>
  </header>
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
    exhibitor: {
      type: Object,
      default: () => ({
        label: "BE OUR EXHIBITOR",
        path: "#"
      })
    }
  },
  data() {
    return {
      isMenuOpen: false,
      showForm: false,
      form: {
        name: '',
        email: '',
        message: '',
      },
      formStatus: '',
    };
  },
  methods: {
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
    },
    async submitForm() {
      if (!this.form.name || !this.form.email || !this.form.message) {
        this.formStatus = "Please fill in all fields.";
        return;
      }

      try {
        const response = await fetch('backend/submit-exhibitor.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(this.form),
        });
        const data = await response.json();
        this.formStatus = data.message;
        if (data.success) {
          this.form = { name: '', email: '', message: '' };
        }
      } catch (error) {
        this.formStatus = "Something went wrong.";
      }
    }
  }

};
</script>

<style scoped>
.header {
  position: absolute;
  top: 0;
  left: 0;
  width: calc(100vw - 100px);
}

.header-container {
  position: relative;
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
  align-items: center;
}

.header-nav a:not(.be-exhibitor) {
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
  transition: all 0.4s ease-in-out;

}

.header-nav a:hover {
  color: #ffffff;
  background: #000000;
  border: 2px solid #ffffff;
  transition: all 0.4s ease-in-out;
}

.header-nav a:hover path {
  stroke: #ffffff;
  fill: #FFFFFF;
  transition: all 0.4s ease-in-out;
}

.header-nav a svg {
  position: absolute;
  top: 50%;
  right: 8px;
  transform: translate(0, -50%);
}

/* Hamburger Icon (Visible on Mobile) */
.header-hamburger {
  display: none;
  cursor: pointer;
}

.be-exhibitor {
  height: 50px;
  background: #40A315;
  padding: 0 24px;
  border-radius: 20px;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  border: none;
  text-decoration: none;
  color: #FFFFFF;
  font-weight: bold;
  transition: all 0.4s ease-in-out;
}

.be-exhibitor:hover {
  text-decoration: none;
  color: #FFFFFF;
  transform: scale(1.1);
  transition: all 0.4s ease-in-out;
}

.header-nav.active {
  gap: 10px;
}

.header-nav.active a {
  border: none;
  margin: 0;
}

.form-modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1;
}

.form-content {
  background: white;
  padding: 20px;
  border-radius: 12px;
  max-width: 500px;
}

form {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

input,
textarea {
  flex-grow: 1;
  margin-bottom: 0;
  padding: 10px;
  background: #FFFFFF;
  border-radius: 8px;
}

.form-buttons {
  display: flex;
  flex-direction: row;
  gap: 12px;
  justify-content: flex-end;

}

button[type='submit'] {
  background-color: #40A315;
  color: #FFFFFF;
}

button[type='button'] {
  background-color: #FFFFFF;
  color: #000000;
  border: 1px solid #000000;
}

button[type='button']:hover {
  border: 1px solid #000000;
}

.status {
  margin-top: 10px;
  font-weight: bold;
}


@media screen and (max-width: 768px) {
  .header {
    width: calc(100vw - 40px);
  }

  .header-container {
    max-width: 100vw;
  }

  .header-logo img {
    height: 92px;
  }

  .header-container {
    padding: 0 20px
  }

  .header-nav a:not(.be-exhibitor) {
    font-size: 1rem;
    height: 32px;
    min-width: max-content;
    padding: 0 24px;
    height: 30px;
  }

  .header-nav {
    gap: 12px;
  }
}

@media (max-width: 425px) {

  .header-container {
    padding: 0 20px;
    width: calc(100vw - 40px);
    min-height: 50px;
    height: 50px;
    max-height: 50px;
  }

  .header-logo img {
    height: 50px;
  }

  /* Hide navigation links and show hamburger icon on mobile */
  .header-nav {
    display: none;
    flex-direction: column;
    width: calc(100% - 20px);
    background-color: white;
    position: absolute;
    top: 50px;
    left: 0;
    padding: 10px;
  }

  .header-nav.active {
    display: flex;
  }

  .header-nav a {
    margin: 10px 0;
    text-align: center;
  }

  .header-hamburger {
    display: block;
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translate(0, -50%);
  }
}
</style>
