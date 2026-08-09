-- รันใน Supabase SQL Editor เพื่อให้เว็บเวอร์ชันนี้อ่าน/เพิ่ม/แก้ไข/ลบได้
alter table public.risks enable row level security;
alter table public.places enable row level security;

drop policy if exists public_read_risks on public.risks;
drop policy if exists public_insert_risks on public.risks;
drop policy if exists public_update_risks on public.risks;
drop policy if exists public_delete_risks on public.risks;
create policy public_read_risks on public.risks for select to anon, authenticated using (true);
create policy public_insert_risks on public.risks for insert to anon, authenticated with check (true);
create policy public_update_risks on public.risks for update to anon, authenticated using (true) with check (true);
create policy public_delete_risks on public.risks for delete to anon, authenticated using (true);

drop policy if exists public_read_places on public.places;
drop policy if exists public_insert_places on public.places;
drop policy if exists public_update_places on public.places;
drop policy if exists public_delete_places on public.places;
create policy public_read_places on public.places for select to anon, authenticated using (true);
create policy public_insert_places on public.places for insert to anon, authenticated with check (true);
create policy public_update_places on public.places for update to anon, authenticated using (true) with check (true);
create policy public_delete_places on public.places for delete to anon, authenticated using (true);

grant select,insert,update,delete on public.risks, public.places to anon, authenticated;

-- ตรวจสอบว่ามีตารางและข้อมูล
select count(*) as risks_count from public.risks;
select count(*) as places_count from public.places;
