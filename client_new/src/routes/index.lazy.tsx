import { createLazyFileRoute } from '@tanstack/react-router'
import { useQuery } from '@tanstack/react-query'
import { ItemColumn } from '../components/ItemColumn'
import '../App.css'
import { Data } from '../types'
import { fetchAnalyses } from '../api'
import { NewBenefit } from '../components/BenefitModal'
 
export const Route = createLazyFileRoute('/')({
  component: Index,
})

function Index() {
    const { isPending, isError, data } = useQuery<Data, Error>({ queryKey: ['fetch-analyses'], queryFn: fetchAnalyses })

    if (isPending) {
      return <span>Loading...</span>
    }
  
    if (isError) {
      return <span>There has been an error. Please try again later.</span>
    }
  
    const [analysis] = data?.data
  
    return (
        <main className="flex min-h-screen flex-col items-center justify-between p-24">
            <div className="flex flex-col items-center w-full">
                <div className="p-4 w-full flex flex-col items-center justify-center  text-slate-800">
                    <h1 className="text-4xl">Cost Benefit Analysis</h1>
                </div>
                <div className="p-4 w-full flex flex-col items-center justify-center bg-slate-400 text-slate-800">
                    <div className="text-2xl">{analysis.name}</div>
                </div>
                <div className="flex w-full">
                    <ItemColumn 
                        name="Cost" 
                        items={analysis.costs} 
                        classes="bg-danger-light text-danger-dark"
                        itemModal={(onClose, isOpen) => <NewBenefit onClose={onClose} isOpen={isOpen} />}
                    />
                    <ItemColumn
                        name="Benefit" 
                        items={analysis.benefits} 
                        classes="bg-success-light text-success-dark"
                        itemModal={(onClose, isOpen) => <NewBenefit onClose={onClose} isOpen={isOpen} />}
                    />
                </div>
            </div>
        </main>
    );
}
