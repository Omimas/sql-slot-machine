# 🍒 SQL Slot Machine

A simple SQL-based slot machine simulation game. Players spin virtual fruit slots and earn points when they hit a jackpot.

---

## 🎮 Overview

This project simulates a slot machine using only SQL queries.  
Each player has 3 slots that randomly generate fruit emojis. Matching all 3 gives a point.

---

## 🧩 Features

- 🧑 Two-player system
- 🎰 Random slot machine logic (🍎 🍋 🍒)
- 🏆 Jackpot detection (3 matching symbols)
- 📊 Score tracking in database
- 📋 Leaderboard sorting

---

## 🗃️ Database Schema

```sql
CREATE TABLE IF NOT EXISTS oyun_durumu (
  oyuncu VARCHAR(10),
  slot1 CHAR(2),
  slot2 CHAR(2),
  slot3 CHAR(2),
  skor INT
);
