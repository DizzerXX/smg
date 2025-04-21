<template>
  <section class="exhibitors">
    <div class="container">
      <h1>{{ title }}</h1>
      <div class="exhibitor-list">
        <div class="exhibitor-item" v-for="item in exhibitors" :key="item.logo">
          <img :src="item.url" :alt="item.logo" />
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
        { logo: 'perkeso', url: '@/assets/image/exhibitors/perkeso.png' },
        { logo: 'myfuturejobs', url: '@/assets/image/exhibitors/myfuturejobs.png' },
        // Placeholder entries for the remaining 28 items
        { logo: 'company1', url: '@/assets/image/exhibitors/company1.png' },
        { logo: 'company2', url: '@/assets/image/exhibitors/company2.png' },
        { logo: 'company3', url: '@/assets/image/exhibitors/company3.png' },
        { logo: 'company4', url: '@/assets/image/exhibitors/company4.png' },
        { logo: 'company5', url: '@/assets/image/exhibitors/company5.png' },
        { logo: 'company6', url: '@/assets/image/exhibitors/company6.png' },
        { logo: 'company7', url: '@/assets/image/exhibitors/company7.png' },
        { logo: 'company8', url: '@/assets/image/exhibitors/company8.png' },
        { logo: 'company9', url: '@/assets/image/exhibitors/company9.png' },
        { logo: 'company10', url: '@/assets/image/exhibitors/company10.png' },
        { logo: 'company11', url: '@/assets/image/exhibitors/company11.png' },
        { logo: 'company12', url: '@/assets/image/exhibitors/company12.png' },
        { logo: 'company13', url: '@/assets/image/exhibitors/company13.png' },
        { logo: 'company14', url: '@/assets/image/exhibitors/company14.png' },
        { logo: 'company15', url: '@/assets/image/exhibitors/company15.png' },
        { logo: 'company16', url: '@/assets/image/exhibitors/company16.png' },
        { logo: 'company17', url: '@/assets/image/exhibitors/company17.png' },
        { logo: 'company18', url: '@/assets/image/exhibitors/company18.png' },
        { logo: 'company19', url: '@/assets/image/exhibitors/company19.png' },
        { logo: 'company20', url: '@/assets/image/exhibitors/company20.png' },
        { logo: 'company21', url: '@/assets/image/exhibitors/company21.png' },
        { logo: 'company22', url: '@/assets/image/exhibitors/company22.png' },
        { logo: 'company23', url: '@/assets/image/exhibitors/company23.png' },
        { logo: 'company24', url: '@/assets/image/exhibitors/company24.png' },
        { logo: 'company25', url: '@/assets/image/exhibitors/company25.png' },
        { logo: 'company26', url: '@/assets/image/exhibitors/company26.png' },
        { logo: 'company27', url: '@/assets/image/exhibitors/company27.png' },
        { logo: 'company28', url: '@/assets/image/exhibitors/company28.png' },
      ],
    },
  },
};
</script>

<style scope>

.exhibitor-list{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 8px;
}
</style>