create table if not exists public.settings (
  id integer primary key check (id = 1),
  opening_times text,
  special_notice text,
  phone_number text,
  email text,
  address text,
  reservation_note text,
  updated_at timestamptz not null default now()
);

insert into public.settings (
  id,
  opening_times,
  special_notice,
  phone_number,
  email,
  address,
  reservation_note
)
values (
  1,
  'Montag - Freitag 08:00 - 17:00\nSamstag 11:00 - 17:00',
  'Neu: Eigene Schokolade in Zusammenarbeit mit dem Zuckerbecker.',
  '0721 / 20 30 397',
  'geraldo.hammer@web.de',
  'Kreuzstrasse 17, 76133 Karlsruhe',
  'Infos im Laden.'
)
on conflict (id) do nothing;

alter table public.settings enable row level security;

drop policy if exists settings_select_public on public.settings;
create policy settings_select_public
on public.settings
for select
to anon, authenticated
using (true);

drop policy if exists settings_update_authenticated on public.settings;
create policy settings_update_authenticated
on public.settings
for update
to authenticated
using (id = 1)
with check (id = 1);
