import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure ParameterSpaceTopology (X : Type u) [TopologicalSpace X] where
  parameterSpace : Type v
  topology : TopologicalSpace parameterSpace
  oneDimensionalChart : parameterSpace ≃ ℝ
  chartContinuous : Continuous oneDimensionalChart
  chartHomeomorph : Homeomorph parameterSpace ℝ

structure ParameterSpaceEvidence {X : Type u} [TopologicalSpace X] (P : ParameterSpaceTopology X) where
  chartContinuousClosed : P.chartContinuous
  chartHomeomorphClosed : Continuous P.chartHomeomorph.toFun ∧ Continuous P.chartHomeomorph.invFun

def ParameterSpaceClosed {X : Type u} [TopologicalSpace X] (P : ParameterSpaceTopology X) : Prop :=
  Continuous P.chartHomeomorph.toFun ∧ Continuous P.chartHomeomorph.invFun

theorem parameter_space_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (P : ParameterSpaceTopology X) (E : ParameterSpaceEvidence P) : ParameterSpaceClosed P := by
  exact E.chartHomeomorphClosed

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse