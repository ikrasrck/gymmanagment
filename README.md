#gymmanagementdatabese

# Gym Management System / Spor Salonu Yönetim Sistemi 🏋️‍♀️

## 📌 Project Description / Proje Açıklaması

This project aims to develop a database system for managing gym memberships, payments, coaches, facilities, and training programs. It helps gym owners automate their operations, enhance member experience, and gain valuable insights through data.

Bu proje, spor salonu üyelikleri, ödemeler, antrenörler, tesisler ve antrenman programlarını yönetmek için bir veritabanı sistemi geliştirmeyi amaçlamaktadır. İşletme sahiplerine operasyonlarını otomatikleştirme, üye deneyimini artırma ve veri yoluyla analiz yapma imkanı sunar.

## 🧱 Database Schema / Veritabanı Şeması

**Tables / Tablolar:**
- `Member`: Üyelerin kimlik, isim, doğum tarihi ve iletişim bilgileri
- `Payment`: Üyelik ödemeleri
- `MembershipPlan`: Farklı üyelik planları (fiyat ve süre dahil)
- `Coach`: Antrenör bilgileri ve uzmanlık alanları
- `Facility`: Salonun fiziksel alanları ve kapasiteleri
- `TrainingProgram`: Antrenman programları ve süreleri


The tables are linked using foreign keys to represent relationships such as members making payments or coaches having training programs.

Tablolar, üyelerin ödeme yapması veya antrenörlerin programlara sahip olması gibi ilişkileri gösterecek şekilde foreign key'lerle birbirine bağlanmıştır.

## 📁 Files Included / Dahil Edilen Dosyalar

- `GymManagement.sql` – SQL script to create the database and insert example data.  
- `Database Management Project.docx` – Project documentation with a summary and ER diagram.


## ▶️ How to Use / Nasıl Kullanılır

1. Import `GymManagement.sql` into a MySQL environment.
2. It will automatically create the `gym_db` database and fill it with sample data.
3. You can run queries such as:
   ```sql
   SELECT * FROM Member;
   SELECT * FROM Payment;

   ## 📈 Application Areas / Kullanım Alanları

- Gym membership and payment tracking  
- Scheduling training programs and managing facilities  
- Data analysis for business insights  
- Automating gym operations for better efficiency
 
- Spor salonu üyelik ve ödeme takibi  
- Antrenman programlarının planlanması ve tesis yönetimi  
- İşletmeler için veri analizi ve karar destek  
- Spor salonu işlemlerinin otomasyonu ve verimlilik artışı

---

## 👤 Developer / Geliştirici

**İkra Sarıçiçek**  
 Department of Computer Engineering (English)  
Biruni University

