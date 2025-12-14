# Звіт до Лабораторної роботи 6: Міграції схем за допомогою Prisma ORM #
## 1. Міграція: test1 ##
**Назва міграції:** `20251214210159_test1`

**Опис:** Додано таблицю `Services`, змінено `genre_name -> genre_n`, також видалено `booking_date`

**Схема Prisma: ДО**
```prisma
model genre {
  genre_id    Int           @id @default(autoincrement())
  genre_name  String           @unique @db.VarChar(40)
  movie_genre movie_genre[]
}

model BOOKING {
  booking_id    Int      @id @default(autoincrement()) @map("booking_id")
  customer_id   Int      @map("customer_id")
  booking_date  DateTime @default(now()) @db.Timestamptz @map("booking_date")
  total_amount  Float    @db.Decimal(8, 2) @map("total_amount") 
```
**Схема Prisma: ПІСЛЯ**
```prisma
model services {
  services_id Int @id @default(autoincrement())
  popcorn Boolean
  Pepsi Boolean
}

model genre {
  genre_id    Int           @id @default(autoincrement())
  genre_n  String           @unique @db.VarChar(40)
  movie_genre movie_genre[]
}

model booking {
  booking_id   Int      @id @default(autoincrement())
  customer_id  Int
  total_amount Decimal  @db.Decimal(8, 2)
  customer     customer @relation(fields: [customer_id], references: [customer_id], onDelete: NoAction, onUpdate: NoAction)
  ticket       ticket[]
}
```
## 2. Міграція: changed_services_table ##
**Назва міграції:** `20251214210322_changed_services_table`

**Опис:** Додано обов'язковий стовпець `pepsi` до таблиці `services`

**Схема Prisma: ДО**
```prisma
model services {
  services_id Int @id @default(autoincrement())
  popcorn Boolean
  glasses Boolean
}
```
**Схема Prisma: ПІСЛЯ**
```prisma
model services {
  services_id Int @id @default(autoincrement())
  popcorn Boolean
  glasses Boolean
  pepsi Boolean
}
```
## 3. Міграція: changed_serv_table_deleted_glasses ##
**Назва міграції:** `20251214210322_changed_services_table`

**Опис:** Видалено стовпець `glasses` з таблиці `services`

**Схема Prisma: ДО**
```prisma
model services {
  services_id Int @id @default(autoincrement())
  popcorn Boolean
  glasses Boolean
  pepsi Boolean
}
```
**Схема Prisma: ПІСЛЯ**
```prisma
model services {
  services_id Int @id @default(autoincrement())
  popcorn Boolean
  pepsi Boolean
}
```
