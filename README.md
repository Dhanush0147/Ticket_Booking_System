# Ticket Booking System

This is a comprehensive SQL-based railway ticket reservation system that supports the complete lifecycle of train travel — from train creation and route assignment to ticket booking, seat allocation, payment handling, and refund processing.

---

## 📁 Project Structure

This project includes:

- **17 Tables** (e.g., train, ticket, passenger, station, user, payment)
- **19 Stored Procedures** for dynamic logic (e.g., booking, cancellation, fare calculation)
- **6 Triggers** to enforce integrity and automate actions
- **2 Views** for easy data visualization
- **Sample Data** for testing

---

## 🔧 Technologies Used

- **MySQL (or any SQL-compatible RDBMS)**
- SQL Scripts for DDL, DML, Views, Triggers, and Procedures

---

## 📚 Schema Highlights

### 👥 User Management
- `admin`: Admin credentials
- `user`: Customer info with name, email, address

### 🚉 Train and Routing
- `station`: Station details
- `train`: Train info, capacity, coach structure
- `route`: Station-wise stop and timing info
- `train_status`: Tracks booked seats
- `train_running_days`: Specifies days of operation

### 🎟️ Ticketing
- `ticket`: Booking data (PNR, user, stations)
- `passenger`: Individual traveler info per PNR
- `seat_allocation`: Allocated berths
- `waitlist`: For overbooked cases

### 💸 Payment and Refund
- `fare`: Fare based on class and distance
- `concession`: Discount slabs (senior citizen, student, etc.)
- `payment`: Payment transaction logs
- `refund_log`: Refund processing and logs

### 📢 Notification
- `notification`: In-app alerts and updates

---

## 📌 Features

- 🚂 Add & manage trains, stations, and routes
- 🧾 Book tickets and generate PNRs
- 🛏️ Auto-assign berths via logic
- 📉 Apply fare concessions
- 🧾 Itemized bill generation
- 💸 Track payments and initiate refunds
- 🔁 Trigger-based validations (e.g., seat overbooking prevention)
- 🧑‍💻 Admin validation and login procedures

---

## 🧠 Key Stored Procedures

- `generate_pnr`: Books a ticket and generates PNR
- `assign_berth`: Allocates berth using logic
- `calculate_ticket_fare`: Computes fare based on route and class
- `apply_concession`: Applies discount
- `cancel_ticket`: Cancels tickets and processes refund
- `total_revenue`: Revenue report
- `busiest_route`: Most traveled route analyzer

---

## ⚠️ Triggers

- `check_ticket_update`: Disallows PNR/coaching change
- `before_berth_assign`: Avoids duplicate berth assignment
- `refund_on_cancel`: Automates refund and updates seat count
- `check_booked_seats`: Validates booking limits

---

## 🗃️ Views

- `train_schedules`: Joined view of train, route, and station
- `train_details`: Live train status (AC/Sleeper)

---

## 🧪 Sample Data

- ✅ 50 Users
- ✅ 10 Admins
- ✅ 10 Major Indian Stations
- ✅ 10 Trains (with real names & distances)
- ✅ 50+ Tickets
- ✅ Sample refunds, payments, seat allocations, and waitlists

---
