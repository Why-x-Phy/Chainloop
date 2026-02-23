# Master Prompt Gap Audit (VPS BTC Institutional App)

This audit maps the current repository state against the provided "ULTRA MASTER PROMPT" and highlights what is already in place vs. what still needs implementation depth.

## Overall status

- **Foundation:** Strong MVP-to-MVP+ baseline exists (Dockerized stack, auth gateway, regime-first API flow, persistence, replay, alerts, paper simulation, gated execution stubs).
- **Ready for continued development on this branch:** **Yes**.
- **Production/institutional completeness vs prompt:** **Partial** (core structure present, several engines are still proxy/baseline implementations and need deeper market-data integrations and model rigor).

## Non-negotiables

- **Explainability first:** Implemented via scenario reason codes and score reason codes.
- **Probabilistic output:** Implemented (`bull_prob`, `bear_prob`, scenario probabilities).
- **Regime first:** Implemented in pipeline ordering and outputs.
- **No-trade valid:** Implemented as explicit scenario.
- **Paper → Live gate:** Implemented with gate status checks and execution disabled by default.
- **Audit/reproducibility:** Implemented via raw snapshots, features, cases, scenarios, scores, outcomes.
- **Security baseline:** Implemented server-side key handling, Basic Auth gateway, DB not exposed by compose.

## Deployment target

- **Ubuntu VPS Docker stack:** Implemented.
- **Browser via IP:** Implemented.
- **Basic Auth admin/0000 for MVP:** Implemented in gateway config/environment baseline.
- **Port 80 only for start:** Implemented in default compose profile.
- **443 optional later:** Implemented as TLS override profile.

## Phase-1 analytics scope coverage

### Implemented baseline
- Multi-timeframe ingestion context (1m/5m/15m/1h/4h/1d).
- Regime output + confidence.
- Pattern set includes ascending/rising wedge baseline checks.
- RSI/MACD/EMA/BB fields integrated in model input and scoring.
- VP/VWAP context engine baseline.
- Liquidity/orderflow proxy context baseline.
- Coinglass context adapter with fallback/degradation.
- Macro NDX/SPX context adapter.
- Event risk mode integration.
- Scenario triplet (Primary/Secondary/No-Trade), score and reason codes.
- Alerts + invalidation/regime-style warnings baseline.

### Gaps to close for strict institutional target
- Pattern validation depth still heuristic; requires stronger geometric/statistical validation and explicit retest/fakeout model calibration.
- Liquidity/orderflow currently proxy-oriented; deeper bookmap-style pulling/stacking and absorption telemetry still needed.
- Coinglass/derivatives engine needs richer coverage and calibration (crowding/cascade model sophistication).
- Volume profile and anchored VWAP engine should include more robust session/anchor selection and confidence scoring.
- Macro engine currently baseline correlation support; add full lead/lag and decoupling diagnostics.

## Data ingestion and fallback

- **Implemented:** Provider fallback/degradation notes and transparent data-quality flags.
- **Implemented:** Raw snapshot storage for reproducibility.
- **Needed next:** Additional provider adapters + quality arbitration across providers with deterministic precedence.

## Feature store / reproducible cases

- **Implemented:** Case/features/scenarios/scores/outcomes persisted.
- **Implemented:** Data degraded flag and notes.
- **Needed next:** Explicit feature versioning lifecycle, schema migrations, and stronger outlier handling policies.

## Institutional decision/scoring framework

- **Implemented:** Subscores + penalties + total score + reason codes.
- **Implemented:** Scenario generator structure with trigger/invalidation/targets/risk notes.
- **Needed next:** Weight optimization per regime with guardrails, confidence intervals, and more explicit minimum-confirmation diagnostics in API response payload.

## Learning & continuous improvement

- **Implemented baseline:** Outcome logging and gate metrics endpoints.
- **Needed next (major):** Walk-forward validation, adaptive weighting by regime with minimum sample constraints, overfit detection reports.

## UI/UX dashboard

- **Implemented baseline:** Dashboard shell + cases + replay + panels.
- **Needed next:** richer visual overlays for institutional analysis depth (liquidity heat, liquidation magnets, advanced VP layers, event overlays) and stronger analyst workflow ergonomics.

## Phase-2 Pionex upgrade readiness

- **Implemented baseline:** Signed client abstraction, prechecks, reconciliation/verify endpoint, hard execution gate default off.
- **Needed next:** production-grade key custody/rotation operations, expanded execution quality metrics, and hardened live kill-switch orchestration before enabling real routing.

## Recommended next build order (branch roadmap)

1. **Engine depth pass:** regime + structure + liquidity + derivatives calibration upgrades.
2. **Provider reliability pass:** multi-provider arbitration + deterministic fallback strategy tests.
3. **Learning pass:** adaptive weighting/walk-forward/overfit guardrails.
4. **UI pass:** analytical overlays and explainability UX improvements.
5. **Execution hardening pass:** keep `EXECUTION_ENABLED=false` until gate KPIs are demonstrably stable.
