<template>
    <section class="directory">
      <div class="container">
        <div class="directory-info">
            <h1>{{ title }}</h1>
            <img :src="image" alt="Exhibition Layout" class="layout-img"/>
        </div>
  
        <table class="booth-table">
          <thead>
            <tr>
              <th colspan="2">BOOTH NAMES</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(booth, index) in boothTable" :key="index">
              <td align="left">{{ booth.name }}</td>
              <td>{{ booth.location }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
  </template>
  

<script>
    export default {
    name: 'Directory',
    props: {
        title: {
            type: String,
            default: 'Floor Directory',
        },
        image: {
            type: String,
        },
        boothTable: {
            type: Array,
            default: () => [
                {name: '', location: ''}
            ],
        },
    },
    };
</script>

<style scoped>
    .container{
        flex-direction: row;
        justify-content: center;
        gap: 20px;
    }

    .directory-info{
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px
    }

    .booth-table {
        border-collapse: collapse;
      }

      .booth-table tr{
        height: 10px;
      }
      
      .booth-table th{
        background: #633273;
        color: #ffffff;
      }

      .booth-table td{
        padding: 0 12px;
      }
      
      /* Alternating row background */
      .booth-table tbody tr:nth-child(even) {
        background-color: #ffff;
      }
      
      .booth-table tbody tr:nth-child(odd) {
        background-color: #e6e6e6;
      }
      
</style>