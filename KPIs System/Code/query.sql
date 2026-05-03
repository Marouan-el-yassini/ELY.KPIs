 pgsql
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  first_name TEXT, last_name TEXT, company TEXT,
  sector TEXT, phone TEXT, email TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "p_sel" ON profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "p_ins" ON profiles FOR INSERT WITH CHECK (auth.uid() = id);
CREATE POLICY "p_upd" ON profiles FOR UPDATE USING (auth.uid() = id);

CREATE TABLE machine_sessions (
  id BIGSERIAL PRIMARY KEY,
  company_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  machine TEXT NOT NULL,
  date DATE NOT NULL,
  temps_planifie_min INTEGER,
  temps_arret_min INTEGER,
  production_theorique INTEGER,
  production_reelle INTEGER,
  quantite_defectueuse INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE machine_sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "ms_sel" ON machine_sessions FOR SELECT USING (auth.uid() = company_id);
CREATE POLICY "ms_ins" ON machine_sessions FOR INSERT WITH CHECK (auth.uid() = company_id); 
