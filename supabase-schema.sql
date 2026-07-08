create extension if not exists pgcrypto;

create table if not exists public.sn_records (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  sn text not null,
  category text not null,
  brand text not null default '',
  name text not null,
  model text not null default '',
  partner text not null default '',
  buy_price numeric not null default 0,
  gift numeric not null default 0,
  shipping numeric not null default 0,
  other_cost numeric not null default 0,
  sale_price numeric not null default 0,
  is_sold boolean not null default false,
  order_date date not null default current_date,
  signed_at timestamptz,
  dock_tracking text not null default '',
  created_at timestamptz not null default now()
);

alter table public.sn_records enable row level security;

create unique index if not exists sn_records_user_sn_key
  on public.sn_records (user_id, sn);

drop policy if exists "Users can read own SN records" on public.sn_records;
create policy "Users can read own SN records"
  on public.sn_records for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own SN records" on public.sn_records;
create policy "Users can insert own SN records"
  on public.sn_records for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own SN records" on public.sn_records;
create policy "Users can update own SN records"
  on public.sn_records for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Users can delete own SN records" on public.sn_records;
create policy "Users can delete own SN records"
  on public.sn_records for delete
  using (auth.uid() = user_id);
