-- Bodega Armenia · tabla para guardar los datos compartidos de la app (solo cantidades)
-- Ejecutar una sola vez en Supabase → SQL Editor del proyecto.
-- Cada fila guarda un bloque de datos: inv, mov, ofv, plan, pesos, cfg.

create table if not exists public.bodega_kv (
  clave       text primary key,
  valor       jsonb,
  actualizado timestamptz not null default now()
);

alter table public.bodega_kv enable row level security;

drop policy if exists "bodega_kv lectura"    on public.bodega_kv;
drop policy if exists "bodega_kv insertar"   on public.bodega_kv;
drop policy if exists "bodega_kv actualizar" on public.bodega_kv;

-- Lectura, alta y actualización con la clave pública (anon). No se permite DELETE.
-- Solo se aceptan las 6 claves que usa la app.
create policy "bodega_kv lectura"    on public.bodega_kv for select to anon using (true);
create policy "bodega_kv insertar"   on public.bodega_kv for insert to anon
  with check (clave in ('inv','mov','ofv','plan','pesos','cfg'));
create policy "bodega_kv actualizar" on public.bodega_kv for update to anon
  using (true) with check (clave in ('inv','mov','ofv','plan','pesos','cfg'));

grant select, insert, update on public.bodega_kv to anon;
