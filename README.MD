# Data Cleaning in Shell

---

**Tujuan Pengerjaan Project**

Membersihkan data *traffic_ecommerce* dan menyisakan data-data yang relevan untuk dapat dilakukan analisis produk yang terjual.

**Detail/deskripi task**
1. Download data traffic_ecommerce di link berikut : (https://www.google.com/url?sa=D&q=https://drive.google.com/file/d/1rKkUQU-sXIDka3rVNBahp6q3wDhrPY-1/view%3Fusp%3Dsharing&ust=1658593380000000&usg=AOvVaw3ZZ5nscJ1MSDu8LkWTMg3D&hl=en)
2. Selanjutnya lakukan perintah `unzip data.zip` agar dapat mengekstrak file *data.zip* di terminal.
3. Buat syntax `vim tugas.sh` untuk membuat file bash script.
4. Buat syntax `#!/bin/bash`, dimana dalam membuat bash script perlu mendefinisikan *shebang* atau *"bang"* line di baris awal file.
5. Selanjutnya syntax `csvstack 2019-Oct-sample.csv 2019-Nov-sample.csv > data_merge.csv`, syntax csvstack digunakan untuk menggabungkan 2 file csv yaitu *data 2019-Oct-sample.csv* dan *2019-Nov-sample.csv* ke dalam satu file csv bernama *data_merge.csv*.
6. Kemudian `awk '{gsub(/\r/,"")}; NR==1 {print $0,"category"}; NR>1 {print $0,$8}' FS="[,. ]" OFS="," data_merge.csv > data_add_category.csv` digunakan untuk menampilkan semua kolom pada *data_merge.csv* dan membuat kolom baru yaitu kolom "category" dimana nilai dari kolom tersebut berasal dari argumen ke-8 dalam list yang dipisahkan oleh tanda koma/titik/spasi dan output pemisahnya berupa tanda titik koma yang disimpan ke dalam file *data_add_category.csv*.
7. 'awk '{gsub(/\r/,"")}; NR==1 {print $0,"product_name"}; NR>1 {print $0,$(NF-6)}' FS="[,. ]" OFS="," data_add_category.csv > data_add_pname.csv', syntax ini berfungsi untuk menambahkan kolom "product_name" dimana nilai dari kolom tersebut diperoleh dari argumen ke-6 yang dihitung dari kolom terakhir dan disimpan ke dalam file *data_add_pname.csv*.
8. `csvcut -c 2,3,4,5,7,8,11,12 data_add_pname.csv > data_filter.csv`, syntax ini digunakan untuk menyeleksi data berdasarkan kolom yang ada.
9. `csvgrep -c "event_type" -m purchase data_filter.csv > data_clean.csv`, syntax ini berfungsi untuk menampilkan data dari kolom "event_type" yang memiliki nilai *purchase*

**Cara Running/Penggunaan Program**
1. Jalankan file bash bernama 'tugas' dengan melakukan perintah `./tugas.sh` pada terminal
2. Untuk melakukan validasi hasil, gunakan word count dan jalankan perintah `cat data/data_clean.csv | grep electronics | grep smartphone| awk -F ',' '{print $5}'| sort | uniq -c | sort -nr` untuk mengetahui hasil sorting dari smartphone.

**Saran Perbaikan**

Setelah dilakukan eksekusi perintah, file berformat .csv menjadi banyak. Diharapkan ke depannya setelah eksekusi dijalankan, data berformat .csv tidak disimpan ke dalam file baru. Hal ini dilakukan agar memori di PC tidak menjadi penuh. 
