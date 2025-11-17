# PRAKTIKUM JARKOM MODUL 3 KELOMPOK 55 - 2025

## Angota Kelompok

| Nama                         | NRP        |
| ---------------------------- | ---------- |
| Ardhi Putra Pradana          | 5027241022 |
| M. Hikari Reiziq Rakhmadinta | 5027241079 |

## Laporan

[LINK SPREADSHEET]
https://docs.google.com/spreadsheets/d/1Ns_DI_YEprcioQDcubR_a5_2euuPRsUyHAMoN4D1RHU/edit?usp=sharing

### CPT - VLSM

1. Berikut topologi yang dibuat untuk cisco packet tracer.

   ![](Assets/Topologi%20CPT.png)

   Setelah dilakukan analisa terhadap topologi tersebut, dapat disimpulkan terdapat sebanyak **23 subnet** yang perlu dilakukan.

2. Total penggunaan subnet.

   Total subnet yang digunakan adalah **23 subnet** dimana total IP yang digunakan adalah **3219 IP** dan menghasilkan total ip yang available adalah **4030 IP** dimana artinya pendekatan terbesar adalah mendapatkan subnet **/20**. Untuk ini dapat lihat pada Spreadsheet yang sudah diberikan diatas.

   Dan berikut adalah hasil VLSM Tree yang ada:

   ![](./Assets/Tree%20VLSM.png)

3. Static routing.

   Pada praktikum ini hanya diharuskan untuk melakukan static routing, dimana dengan hal tersebut harus dilakukan config terhadap tiap router untuk bagaimana bisa mendapatkan rute atau jalur yang diharapkan.

   Cara melakukan routing adalah dengan melihat bagaimana jalur dari satu subnet ke subnet yang lainnya.
   Untuk bagaimana routing dilakukan dapat dilihat pada file berikut ini:

   - [left route](./routings/cpt/left-route.txt)
   - [right route](./routings/cpt/right-route.txt)
   - [bottom route](./routings/cpt/bottom-route.txt)

4. Setting static ip

   Untuk melakukan static ip bisa diset pada tiap tiap router ataupun client, dengan melihat ip range yang sudah ditentukan atau sudah didapatkan pada Spreadsheet.
