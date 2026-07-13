-- Contact form submissions and in-app feedback. user_id is NULL for public
-- (unauthenticated) submissions from the landing page contact form.
CREATE TABLE IF NOT EXISTS feedback (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     UUID REFERENCES users(id) ON DELETE SET NULL,
    name        VARCHAR(200) NOT NULL,
    email       VARCHAR(320) NOT NULL,
    college     VARCHAR(300),
    branch      VARCHAR(200),
    year        VARCHAR(20),
    category    VARCHAR(80)  NOT NULL DEFAULT 'general',
    subject     VARCHAR(300) NOT NULL,
    description TEXT         NOT NULL,
    severity    VARCHAR(40),
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_feedback_created ON feedback(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_feedback_user    ON feedback(user_id) WHERE user_id IS NOT NULL;
