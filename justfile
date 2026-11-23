doc-no-all-features:
	RUSTDOCFLAGS="--cfg docsrs" cargo +nightly doc --no-deps -p chilen_backend

doc:
	RUSTDOCFLAGS="--cfg docsrs" cargo +nightly doc --no-deps -p chilen_backend --all-features

open-doc:
	RUSTDOCFLAGS="--cfg docsrs" cargo +nightly doc --no-deps chilen_backend --all-features --open

test:
	cargo test --workspace
	cargo test --workspace --no-default-features --features codec-wav

check:
	cargo fmt --check --all
	just test
	just doc-no-all-features
	just doc
	cargo deny check

loc:
	cloc src/
