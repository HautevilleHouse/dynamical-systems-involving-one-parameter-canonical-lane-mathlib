import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure LyapunovExponentPackage {X : Type u} [TopologicalSpace X] (F : OneParameterFlow X) where
  tangentSpace : X → Type v
  innerProduct : ∀ (x : X), Inner ℝ (tangentSpace x)
  norm : ∀ (x : X), NormedAddCommGroup (tangentSpace x)
  derivative : ∀ (t : F.time) (x : X), tangentSpace x → tangentSpace (F.phi t x)
  derivativeContinuous : ∀ (t : F.time) (x : X), Continuous (derivative t x)
  cocycleProperty : ∀ (t s : F.time) (x : X), derivative (t + s) x = derivative t (F.phi s x) ∘ derivative s x
  lyapunovExponent : X → ℝ
  lyapunovExponentDefined : ∀ (x : X), ∃ (λ : ℝ), lyapunovExponent x = λ ∧
    Filter.Tendsto (fun (t : F.time) => (1 / (t : ℝ)) * Real.log (‖derivative t x‖)) Filter.atTop (nhds λ)

structure LyapunovExponentEvidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (L : LyapunovExponentPackage F) where
  derivativeContinuousClosed : ∀ (t : F.time) (x : X), Continuous (L.derivative t x)
  cocyclePropertyClosed : ∀ (t s : F.time) (x : X), L.derivative (t + s) x = L.derivative t (F.phi s x) ∘ L.derivative s x
  lyapunovExponentDefinedClosed : ∀ (x : X), ∃ (λ : ℝ), L.lyapunovExponent x = λ ∧
    Filter.Tendsto (fun (t : F.time) => (1 / (t : ℝ)) * Real.log (‖L.derivative t x‖)) Filter.atTop (nhds λ)

def LyapunovExponentClosed {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (L : LyapunovExponentPackage F) : Prop :=
  (∀ (t : F.time) (x : X), Continuous (L.derivative t x)) ∧
  (∀ (t s : F.time) (x : X), L.derivative (t + s) x = L.derivative t (F.phi s x) ∘ L.derivative s x) ∧
  (∀ (x : X), ∃ (λ : ℝ), L.lyapunovExponent x = λ ∧
    Filter.Tendsto (fun (t : F.time) => (1 / (t : ℝ)) * Real.log (‖L.derivative t x‖)) Filter.atTop (nhds λ))

theorem lyapunov_exponent_closed_from_evidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (L : LyapunovExponentPackage F) (E : LyapunovExponentEvidence L) : LyapunovExponentClosed L := by
  exact And.intro E.derivativeContinuousClosed
    (And.intro E.cocyclePropertyClosed E.lyapunovExponentDefinedClosed)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse