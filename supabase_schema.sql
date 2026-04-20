create extension if not exists pgcrypto;

create table if not exists public.aircraft (
  registration text primary key,
  type text,
  owner text,
  capacity_liters numeric,
  created_at timestamptz not null default now()
);

create table if not exists public.fuel_reports (
  id uuid primary key default gen_random_uuid(),
  registration text not null,
  fueler_name text not null,
  pilot_name text not null,
  before_liters numeric not null check (before_liters >= 0),
  after_liters numeric not null check (after_liters >= 0),
  liters_added numeric not null check (liters_added > 0),
  fueled_at timestamptz not null,
  location text,
  notes text,
  signature_data_url text not null,
  created_at timestamptz not null default now()
);

create index if not exists fuel_reports_registration_idx on public.fuel_reports (registration);
create index if not exists fuel_reports_fueled_at_idx on public.fuel_reports (fueled_at desc);

alter table public.aircraft enable row level security;
alter table public.fuel_reports enable row level security;

drop policy if exists "Public read aircraft" on public.aircraft;
create policy "Public read aircraft"
on public.aircraft
for select
to anon
using (true);

drop policy if exists "Public upsert aircraft" on public.aircraft;
create policy "Public upsert aircraft"
on public.aircraft
for insert
to anon
with check (true);

drop policy if exists "Public update aircraft" on public.aircraft;
create policy "Public update aircraft"
on public.aircraft
for update
to anon
using (true)
with check (true);

drop policy if exists "Public read fuel reports" on public.fuel_reports;
create policy "Public read fuel reports"
on public.fuel_reports
for select
to anon
using (true);

drop policy if exists "Public insert fuel reports" on public.fuel_reports;
create policy "Public insert fuel reports"
on public.fuel_reports
for insert
to anon
with check (true);
