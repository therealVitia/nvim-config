return {
	"sphamba/smear-cursor.nvim",
	opts = {
		cursor_color = "#22f9f9",
		particles_enabled = true,
		stiffness = 0.5,
		trailing_stiffness = 0.45,
		trailing_exponent = 3,
		damping = 0.85,
		gradient_exponent = 0,
		gamma = 1,
		never_draw_over_target = true,
		hide_target_hack = true,       -- same
		particle_spread = 0,
		particles_per_second = 200,
		particles_per_length = 3.0,
		particle_max_lifetime = 600,
		particle_max_initial_velocity = 30,
		particle_velocity_from_cursor = 0.5,
		particle_damping = 0.45,
		particle_gravity = 0,
		min_distance_emit_particles = 0,
		particles_over_text = false,
	}
}
