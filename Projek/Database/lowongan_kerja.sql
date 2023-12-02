-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2023 pada 11.29
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lowongan_kerja`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(5) NOT NULL,
  `admin_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apply`
--

CREATE TABLE `apply` (
  `id_apply` int(5) NOT NULL,
  `js_id` int(5) NOT NULL,
  `date_apply` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `approve`
--

CREATE TABLE `approve` (
  `id_approve` int(5) NOT NULL,
  `admin_id` int(5) NOT NULL,
  `date_approve` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `username` int(5) NOT NULL,
  `id_role` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobprovider`
--

CREATE TABLE `jobprovider` (
  `jp_id` int(5) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_address` varchar(100) NOT NULL,
  `company_contact_num` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobseeker`
--

CREATE TABLE `jobseeker` (
  `js_id` int(5) NOT NULL,
  `js_name` varchar(100) NOT NULL,
  `js_address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_num` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `request`
--

CREATE TABLE `request` (
  `id_request` int(5) NOT NULL,
  `jp_id` int(5) NOT NULL,
  `date_request` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(5) NOT NULL,
  `name_role` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vacancy`
--

CREATE TABLE `vacancy` (
  `vacancy_id` int(5) NOT NULL,
  `id_approve` int(5) NOT NULL,
  `id_apply` int(5) NOT NULL,
  `id_request` int(5) NOT NULL,
  `vacancy_title` varchar(100) NOT NULL,
  `vacancy_desc` varchar(100) NOT NULL,
  `num_of_jobs` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`id_apply`),
  ADD KEY `js_id` (`js_id`);

--
-- Indeks untuk tabel `approve`
--
ALTER TABLE `approve`
  ADD PRIMARY KEY (`id_approve`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`),
  ADD KEY `id_role` (`id_role`);

--
-- Indeks untuk tabel `jobprovider`
--
ALTER TABLE `jobprovider`
  ADD PRIMARY KEY (`jp_id`);

--
-- Indeks untuk tabel `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD PRIMARY KEY (`js_id`);

--
-- Indeks untuk tabel `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `jp_id` (`jp_id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`vacancy_id`),
  ADD KEY `id_approve` (`id_approve`,`id_apply`,`id_request`),
  ADD KEY `id_apply` (`id_apply`),
  ADD KEY `id_request` (`id_request`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `approve` (`admin_id`);

--
-- Ketidakleluasaan untuk tabel `apply`
--
ALTER TABLE `apply`
  ADD CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`js_id`) REFERENCES `apply` (`id_apply`),
  ADD CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`id_apply`) REFERENCES `vacancy` (`id_apply`);

--
-- Ketidakleluasaan untuk tabel `approve`
--
ALTER TABLE `approve`
  ADD CONSTRAINT `approve_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `approve` (`id_approve`),
  ADD CONSTRAINT `approve_ibfk_2` FOREIGN KEY (`id_approve`) REFERENCES `vacancy` (`id_approve`);

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `customer` (`username`);

--
-- Ketidakleluasaan untuk tabel `jobprovider`
--
ALTER TABLE `jobprovider`
  ADD CONSTRAINT `jobprovider_ibfk_1` FOREIGN KEY (`jp_id`) REFERENCES `request` (`jp_id`);

--
-- Ketidakleluasaan untuk tabel `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD CONSTRAINT `jobseeker_ibfk_1` FOREIGN KEY (`js_id`) REFERENCES `apply` (`js_id`);

--
-- Ketidakleluasaan untuk tabel `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`jp_id`) REFERENCES `request` (`id_request`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`id_request`) REFERENCES `vacancy` (`id_request`);

--
-- Ketidakleluasaan untuk tabel `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `customer` (`id_role`);

--
-- Ketidakleluasaan untuk tabel `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `vacancy_ibfk_1` FOREIGN KEY (`id_approve`) REFERENCES `vacancy` (`vacancy_id`),
  ADD CONSTRAINT `vacancy_ibfk_2` FOREIGN KEY (`id_apply`) REFERENCES `vacancy` (`vacancy_id`),
  ADD CONSTRAINT `vacancy_ibfk_3` FOREIGN KEY (`id_request`) REFERENCES `vacancy` (`vacancy_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
